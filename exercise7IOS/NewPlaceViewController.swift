//
//  NewPlaceViewController.swift
//  exercise7IOS
//
//  Created by  on 11/26/21.
//

import UIKit

class NewPlaceViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var descTF: UITextField!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var addressTitleTF: UITextField!
    @IBOutlet weak var addressStringTF: UITextField!
    @IBOutlet weak var elevationTF: UITextField!
    @IBOutlet weak var latitudeTF: UITextField!
    @IBOutlet weak var longitudeTF: UITextField!
    
    var place : PlaceDescription = PlaceDescription()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        NSLog("segue identifier is \(segue.identifier)")
        if segue.identifier == "SaveNewPlace" {
            let ptvc:placeTableViewControllerRealTableViewController = segue.destination as! placeTableViewControllerRealTableViewController
            place.name = nameTF.text!
            place.description = descTF.text!
            place.category = categoryTF.text!
            place.addressTitle = addressTitleTF.text!
            place.addressStreet = addressStringTF.text!
            place.elevation = Float(elevationTF.text!) ?? 0
            place.latitude = Float(latitudeTF.text!) ?? 0
            place.longitude = Float(longitudeTF.text!) ?? 0
            
            ptvc.places.append(place)
        }
    }}
