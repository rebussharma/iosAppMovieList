//
//  mainDisplayViewController.swift
//  project_mod_two
//
//  Created by Fall2017 on 12/5/17.
//  Copyright © 2017 Fall2017. All rights reserved.
//

import UIKit
import SQLite3
class mainDisplayViewController: UIViewController {
var dbMain: OpaquePointer?
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("softwareList.sqlite")
        
       
        if sqlite3_open(fileURL.path, &dbMain) != SQLITE_OK {
            print("error opening database")
        }
        if sqlite3_open(fileURL.path, &dbMain) != SQLITE_OK {
            print("error opening database")
        }
        print(fileURL)
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "shopifySegue")
        {
            let controller = segue.destination as! ViewController
            controller.db = dbMain
        }else if(segue.identifier == "dataFillSegue")
        {
            let controller = segue.destination as! dataFillViewController
            controller.dbFill = dbMain
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
