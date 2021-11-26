//
//  NewPlaceTableViewController.swift
//  exercise7IOS
//
//  Created by  on 11/26/21.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
    
    let placeholderData = ["Name", "Description", "Category", "Address Title", "Address Street", "Elevation", "Latitude", "Longitude"]

    var place: PlaceDescription = PlaceDescription()
    
    enum TextFieldData: Int {
        case nameTextField = 0
        case descriptionTextField
        case categoryTextField
        case addressTitleTextField
        case addressStreetTextField
        case elevationTextField
        case latitudeTextField
        case longitudeTextField
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
             
        
        tableView.register(NewPlaceViewCell.self, forCellReuseIdentifier: "newPlaceDetailCell")
        
        
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
    
    
    class NewPlaceViewCell: UITableViewCell {
        
        var placeholder: String? {
            didSet {
                guard let item = placeholder else {return}
                dataTextField.placeholder = item
            }
        }
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            initConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        let dataTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.font = UIFont.systemFont(ofSize: 20)
            return textField
        }()
        
        func initConstraints(){
             
             addSubview(dataTextField)
             
             NSLayoutConstraint.activate([
                 dataTextField.heightAnchor.constraint(equalToConstant: 40),
                 dataTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                 dataTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                 dataTextField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                 dataTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
             ])
             
         }
        
    }
        
     
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newPlaceDetailCell", for: indexPath) as? NewPlaceViewCell {
            cell.selectionStyle = .none
            cell.placeholder = placeholderData[indexPath.row]
            
            cell.dataTextField.tag = indexPath.row
            //cell.dataTextField.delegate = self
            
            return cell
            
        }


        return UITableViewCell()
    }
    
    
    @objc func valueChanged(_ textField: UITextField) {
        switch textField.tag {
        case TextFieldData.nameTextField.rawValue:
            place.name = textField.text
            
        default:
            break
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
