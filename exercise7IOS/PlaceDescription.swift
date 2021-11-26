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
    var latitude: Float
    var longitude: Float
    
    init(jsonString: String) {
        self.name="name"
        self.description = "description"
        self.category = "category"
        self.addressTitle = "addressTitle"
        self.addressStreet = "addressStreet"
        self.elevation = 1234
        self.latitude = 1234
        self.longitude = 1234
        
        //Parse JSON string
        let jsonData = Data(jsonString.utf8)
        do {
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                if let name = json["name"] as? String {
                    self.name = name
                    self.description = json["description"] as? String ?? ""
                    self.category = json["category"] as? String ?? ""
                    self.addressTitle = json["address-title"] as? String ?? ""
                    self.addressStreet = json["address-street"] as? String ?? ""
                    self.elevation = (json["elevation"] as? NSNumber)?.floatValue ?? 0
                    self.latitude = (json["latitude"] as? NSNumber)?.floatValue ?? 0
                    self.longitude = (json["longitude"] as? NSNumber)?.floatValue ?? 0
                }
            }
        } catch let error as NSError {
            print("Faled to load: \(error.localizedDescription)")
            print(String(describing: error))
        }
    }
    
    func toJsonString()  -> String {
        var js: String
        js = ""
        js.append("{")
        js.append("\"name\" : \"\(name),")
        js.append("\"description\" : \"\(description),")
        js.append("\"category\" : \"\(category),")
        js.append("\"address-title\" : \"\(addressTitle),")
        js.append("\"address-street\" : \"\(addressStreet),")
        js.append("\"elevation\" : \(elevation),")
        js.append("\"latitude\" : \(latitude),")
        js.append("\"longitude\" : \(longitude)}")
        
        return js
    }
    
}
