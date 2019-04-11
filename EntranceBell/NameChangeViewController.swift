//
//  NameChangeViewController.swift
//  EntranceBell
//
//  Created by USER on 2019/03/28.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class NameChangeViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet var changeField: UITextField!
    
    @IBOutlet var sendButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeField.delegate = self
        changeField.clearButtonMode = UITextField.ViewMode.always
        //設定値読み込み
        changeField.text = self.userDefaults.string(forKey: "corporateName")
    }
    
    @IBAction func textField(_ sender: Any) {
    }
    
    func textFieldShouldBeginEditing(_ textField:UITextField) -> Bool {
        return true
    }
    //キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        changeField.resignFirstResponder()
        return true
    }
    
    @IBAction func pushButton(_ sender: Any) {
        userDefaults.set(changeField.text!, forKey: "corporateName")
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
