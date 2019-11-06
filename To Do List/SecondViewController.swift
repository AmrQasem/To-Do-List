//
//  SecondViewController.swift
//  To Do List
//
//  Created by Clicks Egypt on 11/5/19.
//  Copyright © 2019 Clicks Egypt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func addBtn(_ sender: Any) {
        let itemObjects = UserDefaults.standard.object(forKey: "items")
        if textField.text != ""{
         
            var items: [String]
            if let tempItems = itemObjects as? [String] {
                items = tempItems
                items.append(textField.text!)
            } else{
                items = [textField.text!]
            }
            
            UserDefaults.standard.set(items, forKey:  "items")
            textField.text = ""
        } else{
            let alert = UIAlertController(title: "Oh Oh..!", message: "Please enter a valid item", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

