//
//  configViewController.swift
//  EntranceBell
//
//  Created by USER on 2019/02/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

import UIKit

class configViwController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var Config: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Config.delegate = self
        
        Config.dataSource = self
    }
    
    let configItem = ["作動時間" , "社名"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configItem.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = Config.dequeueReusableCell(withIdentifier: "ConfigCell" , for: indexPath)
        cell.textLabel!.text = configItem[indexPath.row]
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        switch indexPath.row{
            case 0:self.performSegue(withIdentifier: "TimeChooseViewController", sender: nil)
            case 1:self.performSegue(withIdentifier: "NameChangeViewController", sender: nil)
            default:break
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

}
