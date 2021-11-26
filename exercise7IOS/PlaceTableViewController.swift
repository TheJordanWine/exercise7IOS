//
//  placeTableViewController.swift
//  exercise7IOS
//
//  Created by  on 11/26/21.
//

import UIKit

class PlaceTableViewController: UITableViewController {
    
    var places:[PlaceDescription] = [PlaceDescription(jsonString: "{\"name\" : \"ASU-Poly\",\"description\" : \"Home of ASU's Software Engineering Programs\",\"category\" : \"School\",\"address-title\" : \"ASU Software Engineering\",\"address-street\" : \"7171 E Sonoran Arroyo Mall\nPeralta Hall 230\nMesa AZ 85212\",\"elevation\" : 1384.0,\"latitude\" : 33.306388,\"longitude\" : -111.679121}")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        let place:PlaceDescription = places[indexPath.row]
        cell.textLabel?.text = place.name
        // cell.detailTextLabel?.text = place.type
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
