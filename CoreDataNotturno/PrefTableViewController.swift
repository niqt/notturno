//
//  PrefTableViewController.swift
//  CoreDataNotturno
//
//  Created by Nicola De FIlippo on 15/10/2019.
//  Copyright © 2019 Nicola De FIlippo. All rights reserved.
//

import UIKit
import CoreData

class PrefTableViewController: UITableViewController {
    var ristoranti = Array<RistoranteMO>()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated )
       if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let request: NSFetchRequest<RistoranteMO> = RistoranteMO.fetchRequest()
            let context = appDelegate.persistentContainer.viewContext
            do {
                ristoranti = try context.fetch(request)
                print("COUNT\(ristoranti.count)")
            } catch {
                print(error)
            }
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ristoranti.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPref", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = ristoranti[indexPath.row].name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "toMap" {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let  destinationViewController = segue.destination as!  MapViewController
                        destinationViewController.indirizzo = "Benevento via tenente pellegrini"

                    }
                }
    }
    

}
