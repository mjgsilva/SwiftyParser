//
//  ViewController.swift
//  SwiftyParser
//
//  Created by Mário Silva on 23/12/14.
//  Copyright (c) 2014 Mário Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       NetworkHandler.getDataWithSuccess { (githubData) -> Void in
            let json = JSON(data: githubData)
            if let repoName = json[0]["name"].stringValue {
                println("\(repoName)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

