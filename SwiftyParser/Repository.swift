//
//  Repository.swift
//  SwiftyParser
//
//  Created by Mário Silva on 23/12/14.
//  Copyright (c) 2014 Mário Silva. All rights reserved.
//

import Foundation

class Repository: NSObject, Printable {
    let name: String
    let descript: String
    let language: String
    let url: String
    
    init(name: String?,descript: String?,language: String?,url: String?) {
        self.name = name ?? ""
        self.descript = descript ?? ""
        self.language = language ?? ""
        self.url = url ?? ""
    }
    
    override var description: String {
        return "Repository: \(name), written in \(language): \(description). Link: \(url)"
    }
    
}