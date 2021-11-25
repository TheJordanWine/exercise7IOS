//
//  ViewController.swift
//  exercise7IOS
//
//  Created by  on 11/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tv: UITextView!
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        tv.text = "hello"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

