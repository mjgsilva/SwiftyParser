//
//  Network.swift
//  SwiftyParser
//
//  Created by Mário Silva on 23/12/14.
//  Copyright (c) 2014 Mário Silva. All rights reserved.
//

import Foundation

let githubUrl = "https://api.github.com/users/mjgsilva/repos"

class NetworkHandler {
    
    class func getDataWithSuccess(success: ((githubData: NSData!) -> Void)) {
        getData(NSURL(string: githubUrl)!, completion:{(data, error) -> Void in
            if let urlData = data {
                success(githubData: urlData)
            }
        })
    }

    class func getData(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession();
        
        let dataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"api.github.com", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        dataTask.resume()
    }
}