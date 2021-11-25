//
//  PlaceDescription.swift
//  exercise7IOS
//
//  Created by  on 11/25/21.
//
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

import Foundation

class PlaceDescription {
    var name: String
    var description: String
    var category: String
    var addressTitle: String
    var addressStreet: String
    var elevation: Float
    var lattitude: Float
    var longitude: Float
    
    init(jsonString: String) {
        self.name="name"
        self.description = "description"
        self.category = "category"
        self.addressTitle = "addressTitle"
        self.addressStreet = "addressStreet"
        self.elevation = 1234
        self.lattitude = 1234
        self.longitude = 1234
        
        //Parse JSON string
        let jsonData : Data
        jsonData = jsonString.data(using: .utf8)!
        let json = try? JSONSerialization.jsonObject(with: jsonData, options: [])
        if let dictionary = json as? [String: Any] {
            if let name = (dictionary["name"] as? String) {
                self.name = name
                self.description = dictionary["description"] as! String
                self.category = dictionary["category"] as! String
                self.addressTitle = dictionary["address-title"] as! String
                self.addressStreet = dictionary["address-street"] as! String
                self.elevation = dictionary["elevation"] as! Float
                self.lattitude = dictionary["lattitude"] as! Float
                self.longitude = dictionary["longitude"] as! Float
            }
        }
    }
    
}
