//
//  ViewController.swift
//  SwiftyParser
//
//  Created by Mário Silva on 23/12/14.
//  Copyright (c) 2014 Mário Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var repos = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkHandler.getDataWithSuccess { (githubData) -> Void in
            let json = JSON(data: githubData)
            

            if let repoArray = json.arrayValue {
                
                for repoDict in repoArray {
                    var repoName: String? = repoDict["name"].stringValue
                    var repoDescription: String? = repoDict["description"].stringValue
                    var repoLanguage: String? = repoDict["language"].stringValue
                    var repoURL: String? = repoDict["url"].stringValue

                    var repo = Repository(name: repoName, descript: repoDescription, language: repoLanguage, url: repoURL)
                    self.repos.append(repo)
                }
            }
            
            for repoArray in self.repos {
                println(repoArray)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

