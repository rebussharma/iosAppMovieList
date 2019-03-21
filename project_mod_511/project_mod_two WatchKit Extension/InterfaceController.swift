//
//  InterfaceController.swift
//  project_mod_two WatchKit Extension
//
//  Created by Fall2017 on 11/2/17.
//  Copyright © 2017 Fall2017. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    @IBOutlet var imageBox: WKInterfaceImage!
     let session = WCSession.default
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    func session(_ session: WCSession, didReceive file: WCSessionFile) {
        let imageFile = NSData.init(contentsOf: file.fileURL)
        self.imageBox.setImageData(imageFile! as Data)
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        session.delegate = self
        session.activate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
