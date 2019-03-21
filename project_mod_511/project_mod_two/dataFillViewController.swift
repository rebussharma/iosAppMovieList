//
//  dataFillViewController.swift
//  project_mod_two
//
//  Created by Fall2017 on 12/5/17.
//  Copyright © 2017 Fall2017. All rights reserved.
//

import UIKit
import SQLite3
class dataFillViewController: UIViewController {

    @IBOutlet weak var osSoftwareName: UITextField!
    @IBOutlet weak var osSoftwareType: UITextField!
    @IBOutlet weak var osSoftwareUsage: UITextField!
    @IBOutlet weak var osSoftwareCost: UITextField!
    @IBOutlet weak var osSoftwareDeveloper: UITextField!
    @IBOutlet weak var osSoftwareCl: UITextField!
    @IBOutlet weak var osSoftwareVersion: UITextField!
    @IBOutlet weak var osImageName: UITextField!
    @IBOutlet weak var osOne: UITextField!
    @IBOutlet weak var osTwo: UITextField!
    @IBOutlet weak var osthree: UITextField!
    @IBAction func submitButton(_ sender: UIButton) {
        queryForSoftwareTable();
    }
    var dbFill: OpaquePointer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if sqlite3_exec(dbFill, "CREATE TABLE IF NOT EXISTS softwareList (softwareName TEXT PRIMARY KEY NOT NULL, softwareType TEXT NOT NULL, softwareUsage TEXT NOT NULL,softwareCost TEXT NOT NULL,softwareDeveloper TEXT NOT NULL,softwareCodedLanguage TEXT NOT NULL,softwareVersion TEXT, softwareImage TEXT NOT NULL)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error creating table softwareList: \(errmsg)")
        } 
        if sqlite3_exec(dbFill, "CREATE TABLE IF NOT EXISTS osList (osName TEXT PRIMARY KEY NOT NULL)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error creating table osList: \(errmsg)")
        }
        
        if sqlite3_exec(dbFill, "CREATE TABLE IF NOT EXISTS supportedOS (SID INTEGER PRIMARY KEY AUTOINCREMENT, softwareName TEXT NOT NULL, osName TEXT NOT NULL , FOREIGN KEY (softwareName) REFERENCES softwareList(softwareName),FOREIGN KEY (osName) REFERENCES osList(osName))", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error creating table supported Os: \(errmsg)")
        }
        
        /************************** Queries For Os***************************/
        
        let queryString = "INSERT INTO osList(osName) SELECT 'Windows os' WHERE NOT EXISTS(SELECT 1 FROM osList WHERE osName = 'Windows os')"
        if sqlite3_exec(dbFill,queryString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error inserting window: \(errmsg)")
        }
        
        let queryTwoString = "INSERT INTO osList(osName) SELECT 'Mac os' WHERE NOT EXISTS(SELECT 1 FROM osList WHERE osName = 'Mac os')"
        if sqlite3_exec(dbFill,queryTwoString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error creating table mac: \(errmsg)")
        }
        
        let queryThreeString = "INSERT INTO osList(osName) SELECT 'Linux os' WHERE NOT EXISTS(SELECT 1 FROM osList WHERE osName = 'Linux os')"
        if sqlite3_exec(dbFill,queryThreeString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error creating table linux: \(errmsg)")
        }
        
        //***************************************************************************
        let softwareListQueryString = "INSERT INTO softwareList(softwareName,softwareType,softwareUsage,softwareCost,softwareDeveloper,softwareCodedLanguage,softwareVersion,softwareImage) SELECT 'Adobe Acrobat','Application Software', 'File Processor', '178.99','Adobe Systems', 'c++','18.009','adobe.png' WHERE NOT EXISTS(SELECT 1 FROM softwareList WHERE softwareName =  'Adobe Acrobat' AND softwareType = 'Application Software' AND softwareUsage = 'File Processor'AND softwareCost = '178.99' AND softwareDeveloper = 'Adobe Systems'  AND softwareCodedLanguage = 'c++' AND softwareVersion = '18.009'  AND softwareImage = 'adobe.png')"
        if sqlite3_exec(dbFill,softwareListQueryString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error inserting adobe: \(errmsg)")
        }
        
        let twosoftwareListQueryString = "INSERT INTO softwareList(softwareName,softwareType,softwareUsage,softwareCost,softwareDeveloper,softwareCodedLanguage,softwareVersion,softwareImage) SELECT 'Microsoft Word','Application Software', 'File Processor', '109.99','Microsoft', 'c++','16.0.7668','msWord.png' WHERE NOT EXISTS(SELECT 1 FROM softwareList WHERE softwareName =  'Microsoft Word' AND softwareType = 'Application Software' AND softwareUsage = 'File Processor' AND softwareCost = '109.99' AND softwareDeveloper = 'Microsoft'  AND softwareCodedLanguage = 'c++' AND softwareVersion = '16.0.7668'  AND softwareImage = 'msWord.png')"
        if sqlite3_exec(dbFill,twosoftwareListQueryString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error inserting microsoft: \(errmsg)")
            
        }
 
        let threesoftwareListQueryString = "INSERT INTO softwareList(softwareName,softwareType,softwareUsage,softwareCost,softwareDeveloper,softwareCodedLanguage,softwareVersion,softwareImage) SELECT 'Xcode','Application Software', 'IDE', 'Free','Apple', 'Objective C','9.2','xcode.png' WHERE NOT EXISTS(SELECT 1 FROM softwareList WHERE softwareName =  ' Xcode' AND softwareType = 'Application Software' AND softwareUsage = 'IDE' AND softwareCost = 'Free' AND softwareDeveloper = 'Apple'  AND softwareCodedLanguage = 'Objective C' AND softwareVersion = '9.2'  AND softwareImage = 'xcode.png')"
        if sqlite3_exec(dbFill,threesoftwareListQueryString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error inserting xcode: \(errmsg)")
            
        }
        
        let foursoftwareListQueryString = "INSERT INTO softwareList(softwareName,softwareType,softwareUsage,softwareCost,softwareDeveloper,softwareCodedLanguage,softwareVersion,softwareImage) SELECT 'Linux Mint','System Software', 'Operating System', 'Free','Ubuntu Community', 'C++','18.3','linux.png' WHERE NOT EXISTS(SELECT 1 FROM softwareList WHERE softwareName =  ' Linux Mint' AND softwareType = 'System Software' AND softwareUsage = 'Operating System' AND softwareCost = 'Free' AND softwareDeveloper = 'Ubuntu Community'  AND softwareCodedLanguage = 'C' AND softwareVersion = '18.3'  AND softwareImage = 'linux.png')"
        if sqlite3_exec(dbFill,foursoftwareListQueryString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error inserting linux: \(errmsg)")
        //***************************************************************************
            
            let queryThreeString = "INSERT INTO supportedOS( softwareName,osName) SELECT 'Adobe Acrobat', 'Windows os' WHERE NOT EXISTS(SELECT 1 FROM supportedOS WHERE softwareName = 'Adobe Acrobat' AND osName = 'Windows os')"
            
            if sqlite3_exec(dbFill,queryThreeString, nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
                print("error creating relation between acrobat and windows: \(errmsg)")
            }
            
            let queryFourString = "INSERT INTO supportedOS( softwareName,osName) SELECT 'Adobe Acrobat','Mac os' WHERE NOT EXISTS(SELECT 1 FROM supportedOS WHERE softwareName = 'Adobe Acrobat' AND osName = 'Mac os')"
            if sqlite3_exec(dbFill,queryFourString, nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
                print("error creating relation between acrobat and mac: \(errmsg)")
            }
            let queryFiveString = "INSERT INTO supportedOS( softwareName,osName) SELECT 'Microsoft Word','Windows os' WHERE NOT EXISTS(SELECT 1 FROM supportedOS WHERE softwareName = 'Microsoft Word' AND osName = 'Windows os')"
            if sqlite3_exec(dbFill,queryFiveString, nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
                print("error creating relation between microsoft word and windows: \(errmsg)")
            }
            
            let querySixString = "INSERT INTO supportedOS( softwareName,osName) SELECT 'Microsoft Word','Mac os' WHERE NOT EXISTS(SELECT 1 FROM supportedOS WHERE softwareName = 'Microsoft Word' AND osName = 'Mac os')"
            if sqlite3_exec(dbFill,querySixString, nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
                print("error creating relation between microsoft and windows: \(errmsg)")
            }
            
            let querySevenString = "INSERT INTO supportedOS( softwareName,osName) SELECT 'Xcode','Mac os' WHERE NOT EXISTS(SELECT 1 FROM supportedOS WHERE softwareName = 'Xcode' AND osName = 'Mac os')"
            if sqlite3_exec(dbFill,querySevenString, nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
                print("error creating relation between xcode and mac os: \(errmsg)")
            }
            
            let queryEightString = "INSERT INTO supportedOS(softwareName,osName) SELECT 'Linux Mint','Linux os' WHERE NOT EXISTS(SELECT 1 FROM supportedOS WHERE softwareName = 'Linux Mint' AND osName = 'Linux os')"
            if sqlite3_exec(dbFill,queryEightString, nil, nil, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
                print("error creating relation between linux mint and linux  os: \(errmsg)")
            }
            
            
        }
        // Do any additional setup after loading the view.
    }

    func queryForSoftwareTable(){
        
        var softwareListQueryString = "INSERT INTO softwareList(softwareName,softwareType,softwareUsage,softwareCost,softwareDeveloper,softwareCodedLanguage,softwareVersion,softwareImage) SELECT "
        softwareListQueryString =  softwareListQueryString + "'" + osSoftwareName.text! + "', '"
        softwareListQueryString = softwareListQueryString + osSoftwareType.text!  + "', '"
         softwareListQueryString = softwareListQueryString + osSoftwareUsage.text! + "', '"
         softwareListQueryString = softwareListQueryString + osSoftwareCost.text! + "', '"
        softwareListQueryString = softwareListQueryString + osSoftwareDeveloper.text! + "', '"
        softwareListQueryString = softwareListQueryString + osSoftwareCl.text! + "', '"
          softwareListQueryString = softwareListQueryString + osSoftwareVersion.text! + "', '"
        softwareListQueryString = softwareListQueryString + osImageName.text! + "' "
         softwareListQueryString = softwareListQueryString + "WHERE NOT EXISTS(SELECT 1 FROM softwareList WHERE softwareName = "
        softwareListQueryString = softwareListQueryString + "'" + osSoftwareName.text! + "'"
        softwareListQueryString = softwareListQueryString + " AND softwareType = '" + osSoftwareType.text!
        softwareListQueryString = softwareListQueryString + "' AND softwareUsage = '" + osSoftwareUsage.text!
        softwareListQueryString = softwareListQueryString +  "' AND softwareCost = '" + osSoftwareCost.text!
        softwareListQueryString = softwareListQueryString + "' AND softwareDeveloper = '" + osSoftwareDeveloper.text!
        softwareListQueryString = softwareListQueryString + "' AND softwareCodedLanguage = '" + osSoftwareCl.text!
        softwareListQueryString = softwareListQueryString + "' AND softwareVersion = '" + osSoftwareVersion.text!
        softwareListQueryString = softwareListQueryString + "' AND softwareImage = '" + osImageName.text! + "')"

        
        
       if sqlite3_exec(dbFill,softwareListQueryString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error inserting New: \(errmsg)")
        }
        insertingRelation()
    }
    
    func createQueryString(label: UITextField)
    {
        var softwareListQueryString = "INSERT INTO supportedOS( softwareName, osName) SELECT '"
        softwareListQueryString = softwareListQueryString + osSoftwareName.text! + "', '"
        softwareListQueryString = softwareListQueryString + label.text! + "' "
        softwareListQueryString = softwareListQueryString + "WHERE NOT EXISTS(SELECT 1 FROM supportedOS WHERE softwareName = "
        softwareListQueryString = softwareListQueryString + "'" + label.text! + "'"
        softwareListQueryString = softwareListQueryString + " AND osName = '" + label.text! + "')"
        if sqlite3_exec(dbFill,softwareListQueryString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbFill)!)
            print("error loling New: \(errmsg)")
        }
    }
    
    func insertingRelation()
    {
        if (osOne.text! != "")
        {
            createQueryString(label: osOne)
        }
        if (osTwo.text! != "")
        {
            createQueryString(label: osTwo)
        }
        if(osthree.text! != "")
        {
            createQueryString(label: osthree)
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
