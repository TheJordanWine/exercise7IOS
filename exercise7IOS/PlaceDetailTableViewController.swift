//
//  PlaceDetailTableViewController.swift
//  exercise7IOS
//
//  Created by  on 11/26/21.
//

import UIKit

class PlaceDetailTableViewController: UITableViewController {
    
    var places: [PlaceDescription] = [PlaceDescription]()
    var selectedPlaceIndex: Int = -1

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
        return 8 // number of elements of a PlaceDescription
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeDetailCell", for: indexPath)
        
        // This is NOT the right way to do this.
        let mirror = Mirror(reflecting: places[selectedPlaceIndex])
        for (index, attr) in mirror.children.enumerated() {
            if let prop_name = attr.label as String? {
                if index == indexPath.row {
                    cell.textLabel?.text = prop_name
                    if index > 4 {
                        let f = attr.value as? Float ?? 0
                        let stringF = String(describing: f)
                        cell.detailTextLabel?.text = stringF
                    } else {
                        cell.detailTextLabel?.text = (attr.value as? String) ?? ""
                    }
                }
            }
        }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
