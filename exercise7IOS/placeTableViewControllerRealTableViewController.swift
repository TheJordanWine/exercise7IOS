//
//  placeTableViewControllerRealTableViewController.swift
//  exercise7IOS
//
//  Created by  on 11/26/21.
//

import UIKit

class placeTableViewControllerRealTableViewController: UITableViewController {
    
    var places:[PlaceDescription] = [PlaceDescription(jsonString: "{\"name\" : \"ASU-Poly\",\"description\" : \"Home of ASU's Software Engineering Programs\",\"category\" : \"School\",\"address-title\" : \"ASU Software Engineering\",\"address-street\" : \"7171 E Sonoran Arroyo Mall\\nPeralta Hall 230\\nMesa AZ 85212\",\"elevation\" : 1384.0,\"latitude\" : 33.306388,\"longitude\" : -111.679121}")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let place:PlaceDescription = places[indexPath.row]
        cell.textLabel?.text = place.name
        // cell.detailTextLabel?.text = place.type
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NSLog("\(type(of: self)), viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NSLog("\(type(of: self)), viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NSLog("\(type(of: self)), viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NSLog("\(type(of: self)), viewDidDisappear")
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        NSLog("segue identifier is \(segue.identifier)")
        if segue.identifier == "PlaceDetail" {
            let pdtvc:PlaceDetailTableViewController = segue.destination as! PlaceDetailTableViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            pdtvc.places = self.places
            pdtvc.selectedPlaceIndex = indexPath.row
        }
    }
    

}
