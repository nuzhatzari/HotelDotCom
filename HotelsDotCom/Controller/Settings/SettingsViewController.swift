//
//  SettingsViewController.swift
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 22/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtAPIKey: UITextField!
    @IBOutlet weak var txtHost: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let apiKey = UserDefaults.standard.value(forKey: "APIKey") as? String {
            txtAPIKey.text = apiKey
        }
        if let host = UserDefaults.standard.value(forKey: "Host") as? String {
            txtHost.text = host
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onSaveBtnClicked(_ sender: UIButton) {
        
        if validate() {
            UserDefaults.standard.set(txtHost.text, forKey: "Host")
            UserDefaults.standard.set(txtAPIKey.text, forKey: "APIKey")
            self.navigationController?.popViewController(animated: true)
        }else {
            CustomViews.showAlert(withTitle: "Warnings!", message: "Please enter valid API Key and Host.", andViewController: self)
        }
    }
    
    //MARK: - TextField Delegate
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func validate() -> Bool {
        
        if txtAPIKey.text == nil || txtAPIKey.text!.count <= 0 || txtHost.text == nil || txtHost.text!.count <= 0 {
            return false
        }
        return true
    }

}
