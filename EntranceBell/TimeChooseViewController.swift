//
//  TimeChooseViewController.swift
//  EntranceBell
//
//  Created by USER on 2019/02/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class TimeChooseViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var ChooseTable: UITableView!
    
    @IBOutlet var returnButton: UIButton!
    
    let chooseItem = [ 5 , 10 , 15 , 30 , 45 , 60 ]
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ChooseTable.delegate = self
        ChooseTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chooseItem.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = ChooseTable.dequeueReusableCell(withIdentifier: "TimeChooseCell" , for: indexPath)
        cell.textLabel!.text = chooseItem[indexPath.row].description + "秒"
        if(userDefaults.integer(forKey: "indexNo") == indexPath.row){
         self.ChooseTable.selectRow(at: indexPath, animated: false, scrollPosition: .none)
         cell.accessoryType = .checkmark
        }
        return cell;
    }
    //セルが選択された時に呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        let cell = ChooseTable.cellForRow(at: indexPath)
        //選択されたセルにチェックマークを入れる
        cell?.accessoryType = .checkmark
        //userDefaultsへ保存
        userDefaults.set(indexPath.row, forKey: "indexNo")
    }
    //セルの選択が外れた時に呼び出される
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath : IndexPath) {
        let cell = ChooseTable.cellForRow(at: indexPath)
        //選択から外れたセルのチェックマークを外す
        cell?.accessoryType = .none
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
