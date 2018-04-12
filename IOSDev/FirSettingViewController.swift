//
//  ThirdViewController.swift
//  IOSDev
//
//  Created by Илья on 22.03.2018.
//  Copyright © 2018 Ilya. All rights reserved.
//

import UIKit


var myIndex = 0

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var TableViewElements = ["Язык","Тема"]
    let cellIdentifier = "CustomTableViewCell"

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)

        switch SettingIdentifier[0] {
        case "Русский":
            TableViewElements = ["Язык","Тема"]
        case "English":
            TableViewElements = ["Language","Theme"]
        default:
            TableViewElements = ["Язык","Тема"]
        }
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        switch SettingIdentifier[0] {
        case "Русский":
            TableViewElements = ["Язык","Тема"]
        case "English":
            TableViewElements = ["Language","Theme"]
        default:
            TableViewElements = ["Язык","Тема"]
        }
        tableView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return TableViewElements.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        cell.settingLbl?.text = TableViewElements[indexPath.row]
        cell.secondSettingLbl?.text = SettingIdentifier[indexPath.row]
        return cell
        
    }
   
}
