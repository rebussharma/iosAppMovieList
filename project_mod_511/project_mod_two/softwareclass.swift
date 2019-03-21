//
//  softwareclass.swift
//  project_mod_two
//
//  Created by Fall2017 on 11/2/17.
//  Copyright © 2017 Fall2017. All rights reserved.
//

import Foundation

class Software{
    
    var softwareName = String()
    
    var softwareType = String()
    var softwareUsage = String()
    var softwareCost = String()//why ned this?
    var softwareDeveloper = String()
    var imageFileName = String()
    var softwareCodedLanguage = String()
    var softwareVersion = String()
    var relatedSoftwareList = [Software]()
    var OperatingSystem = [String]()
    

    
    
    
    init (softwareName: String, softwareType: String, softwareUsage: String, softwareCost: String, softwareDeveloper: String, softwareCodedLanguage: String, softwareVersion: String, imageFileName: String)
    {
        self.softwareName = softwareName
        self.softwareDeveloper = softwareDeveloper
        self.imageFileName = imageFileName
        self.softwareType = softwareType
        self.softwareCost = softwareCost
        self.softwareUsage = softwareUsage
       self.softwareVersion = softwareVersion
        self.softwareCodedLanguage = softwareCodedLanguage
    }
    
    func addOS(operatingSystem: String )
    {
        OperatingSystem.append(operatingSystem)
        
    }
    
    func addRelatedSoftware(softwareToBeAdded: Software)
    {
        relatedSoftwareList.append(softwareToBeAdded)
    }
}
