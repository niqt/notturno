//
//  DetailViewController.swift
//  CoreDataNotturno
//
//  Created by Nicola De FIlippo on 15/10/2019.
//  Copyright © 2019 Nicola De FIlippo. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    var name: String = ""
    @IBAction func peferito(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let restaurant = RistoranteMO(context: appDelegate.persistentContainer.viewContext)
            restaurant.name = name
            appDelegate.saveContext()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = name
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var labelName: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
