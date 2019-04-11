//
//  Config ViewController.swift
//  EntranceBell
//
//  Created by USER on 2019/02/13.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class ConfigViwController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var Config: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        func tableView(_tableView: UITableView, numberOfRowsInsection section: Int)-> Int{
            return 0
        }
        func tableView(_tableView: UITableView, CellForRowAt indexPath: IndexPath)-> UITableViewCell{
            return UITableViewCell()
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
