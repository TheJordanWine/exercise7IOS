/*
 * Copyright 2021 Jordan Wine,
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Purpose: This app is a demonstration of competency to create a mobile application
 * for ASU SER 423 course requirements. This provides the instructor of SER 423 as well as
 * Arizona State University the right to build and evaluate this software package for the purpose
 * of determining a grade and program assessment.
 *
 * Ser423 Mobile Applications
 * @author Jordan Wine jordan.wine@asu.edu
 * @version November, 2021
 */
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
