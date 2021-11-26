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
