//511
//  ViewController.swift
//  project_mod_two
//
//  Created by Fall2017 on 11/2/17.
//  Copyright © 2017 Fall2017. All rights reserved.
//

import UIKit
import SQLite3
import WatchConnectivity

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WCSessionDelegate {
    let session = WCSession.default
    var db: OpaquePointer?
    
   // readValues()
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    var softwareList = [Software]()
    var selectedRow: Int?
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return softwareList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! segueSoftwareTableViewCell
        cell.softwareName.text = softwareList[indexPath.row].softwareName
        cell.softwareImage.image = UIImage(named: softwareList[indexPath.row].imageFileName)
        cell.cost.text = softwareList[indexPath.row].softwareCost
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      readValues()
    }
   
    func readValues()
    {   softwareList.removeAll();
        let queryString = "SELECT * FROM softwareList";
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
        {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        var index = 0;
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            let name = String(cString: sqlite3_column_text(stmt, 0))
            let type = String(cString: sqlite3_column_text(stmt, 1))
            let usage = String(cString: sqlite3_column_text(stmt, 2))
            let cost = String(cString: sqlite3_column_text(stmt, 3))
            let developer = String(cString: sqlite3_column_text(stmt, 4))
            let coded = String(cString: sqlite3_column_text(stmt, 5))
            let version = String(cString: sqlite3_column_text(stmt, 6))
            let image = String(cString: sqlite3_column_text(stmt, 7))
            //adding values to list
            softwareList.append(Software.init(softwareName: name, softwareType: type, softwareUsage: usage, softwareCost: cost, softwareDeveloper: developer, softwareCodedLanguage: coded, softwareVersion: version, imageFileName: image))
            print(name);
            loadOS(softwareName: name, index: index)
            loadRelatedSoftware(softwareName: name, index: index)
            var testHo = 0;
            while(testHo < softwareList[index].relatedSoftwareList.count)
            {
                print(softwareList[index].relatedSoftwareList[testHo].softwareName)
                testHo = testHo + 1
            }
            index = index + 1
        }
        
        
    }
    
    func loadOS(softwareName: String, index: Int)
    {
         var stmtOS:OpaquePointer?
         let queryStringOS = "SELECT osName from supportedOS where softwareName = " + "\"" + softwareName + "\"";
         if sqlite3_prepare(db, queryStringOS, -1, &stmtOS, nil) != SQLITE_OK
         {
         let errmsg = String(cString: sqlite3_errmsg(db)!)
         print("error preparing insert: \(errmsg)")
         return
         }
         while(sqlite3_step(stmtOS) == SQLITE_ROW)
         {
         let relatedos = String(cString: sqlite3_column_text(stmtOS, 0))
         softwareList[index].addOS(operatingSystem: relatedos)
         //print(relatedos);
         }
        
    }
    
    func loadRelatedSoftware(softwareName: String, index: Int)
    {
        var stmtRS:OpaquePointer?
        var strinOSList: String = ""
        print(softwareList[index].OperatingSystem.count);
        for indo in stride(from: 0, to:softwareList[index].OperatingSystem.count, by: 1)
        {
            if(indo == (softwareList[index].OperatingSystem.count-1))
            {
              strinOSList = "\"" + strinOSList + softwareList[index].OperatingSystem[indo] + "\""
            }
            else
            {
                strinOSList =  strinOSList + softwareList[index].OperatingSystem[indo] + "\"" + " OR osName = " + "\""
            }
            
        }
        strinOSList = strinOSList + ") and (softwareName != " +  "\"" + softwareName + "\")";
        
        let queryStringOS = "SELECT DISTINCT softwareName from supportedOS where (osName = " + strinOSList
        
      print(queryStringOS)
      if sqlite3_prepare(db, queryStringOS, -1, &stmtRS, nil) != SQLITE_OK
        {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error setting insert: \(errmsg)")
            return
        }
        while(sqlite3_step(stmtRS) == SQLITE_ROW)
        {
            let relatedSoftware = String(cString: sqlite3_column_text(stmtRS, 0))
            //softwareList[index].addOS(operatingSystem: relatedos)
        //    print(relatedSoftware);
            let queryString = "SELECT * FROM softwareList where softwareName = " + "\"" + relatedSoftware + "\"";
            var stmt:OpaquePointer?
            
            if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
            {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error getting insert: \(errmsg)")
                return
            }
                while(sqlite3_step(stmt) == SQLITE_ROW)
                {
                    let name = String(cString: sqlite3_column_text(stmt, 0))
                    let type = String(cString: sqlite3_column_text(stmt, 1))
                    let usage = String(cString: sqlite3_column_text(stmt, 2))
                    let cost = String(cString: sqlite3_column_text(stmt, 3))
                    let developer = String(cString: sqlite3_column_text(stmt, 4))
                    let coded = String(cString: sqlite3_column_text(stmt, 5))
                    let version = String(cString: sqlite3_column_text(stmt, 6))
                    let image = String(cString: sqlite3_column_text(stmt, 7))
                    print(name)
                
                    let newObject = Software(softwareName: name, softwareType: type, softwareUsage: usage, softwareCost: cost, softwareDeveloper: developer, softwareCodedLanguage: coded, softwareVersion: version, imageFileName: image)
                    
                    softwareList[index].addRelatedSoftware(softwareToBeAdded: newObject)
                }
                
           
           
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "segueSoftware", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextController = segue.destination as! furtherDescriptionViewController
        nextController.softwareFileName = softwareList[selectedRow!].softwareName
        nextController.softwareDeveloper = softwareList[selectedRow!].softwareDeveloper
        nextController.softwareImageFile = softwareList[selectedRow!].imageFileName
       nextController.recomSoftWare = softwareList[selectedRow!].relatedSoftwareList
        nextController.softwareClassName = softwareList[selectedRow!].softwareType
        nextController.softwareUsage = softwareList[selectedRow!].softwareUsage
        nextController.softwareVersion = softwareList[selectedRow!].softwareVersion
        nextController.softwareCost = softwareList[selectedRow!].softwareCost

        
        let delCharSet = NSCharacterSet(charactersIn: ".png")
        let temporary = softwareList[selectedRow!].imageFileName.trimmingCharacters(in:delCharSet as CharacterSet)
        session.delegate = self
        session.activate()
        let path = Bundle.main.url(forResource: temporary, withExtension: "png")
        session.transferFile(path!, metadata: nil)
        
    }
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

