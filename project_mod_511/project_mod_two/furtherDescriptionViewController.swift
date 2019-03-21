//511
//  furtherDescriptionViewController.swift
//  project_mod_two
//
//  Created by Fall2017 on 11/2/17.
//  Copyright © 2017 Fall2017. All rights reserved.
//

import UIKit

class furtherDescriptionViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    

    

    @IBOutlet weak var softwareImage: UIImageView!
    @IBOutlet weak var softwareDeveloperName: UILabel!
    @IBOutlet weak var softwarenameDetailed: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var softwareClass: UILabel!
    @IBOutlet weak var usage: UILabel!
    @IBOutlet weak var version: UILabel!
    @IBOutlet weak var supportedBy: UILabel!
    
    var softwareFileName: String?
    var softwareDeveloper: String?
    var softwareImageFile: String?
    var softwareClassName: String?
    var softwareSupportedBy: String?
    var softwareUsage: String?
    var softwareVersion: String?
    var softwareCost: String?
    
    
    var recomSoftWare: [Software]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  recomSoftWare!.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recomendedCell = tableView.dequeueReusableCell(withIdentifier: "recomendedCell", for: indexPath)
        recomendedCell.textLabel?.text = recomSoftWare![indexPath.row].softwareName
        recomendedCell.imageView?.image = UIImage(named: recomSoftWare![indexPath.row].imageFileName)
        return recomendedCell
    }
    override func viewDidLoad() {
       
        super.viewDidLoad()
        softwareImage.image = UIImage(named: softwareImageFile!)
        softwareDeveloperName.text = softwareDeveloper
        softwarenameDetailed.text = softwareFileName
        cost.text = softwareCost
        usage.text = softwareUsage
        version.text = softwareVersion
        softwareClass.text = softwareClassName
       // supportedBy.text = softwareSupportedBy
        
        // Do any additional setup after loading the view.
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
