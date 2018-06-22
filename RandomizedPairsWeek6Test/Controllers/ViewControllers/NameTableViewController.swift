//
//  NameTableViewController.swift
//  RandomizedPairsWeek6Test
//
//  Created by Joshua Danner on 6/22/18.
//  Copyright © 2018 JoshuaDanner. All rights reserved.
//

import UIKit

class NameTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return NameController.sharedController.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
 

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // MARK: IBActions
    
    @IBAction func addNameButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "⭐️ Enter Challenger Here ⭐️", message: nil, preferredStyle: .alert)
        
        let _ = alertController.addTextField { (textField) in textField.placeholder = "Contestants name..."
            
        }
        
        let cancelAction = UIAlertAction(title: "😡 Cancel", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        let addAction = UIAlertAction(title: "😁 Add", style: .default) { (action) in
            guard let contestantName = alertController.textFields?[0].text, !contestantName.isEmpty else { return }
            NameController.sharedController.createName(name: contestantName)
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        present(alertController, animated: true, completion: nil)
    }
    
}





















