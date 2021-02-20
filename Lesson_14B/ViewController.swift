//
//  ViewController.swift
//  Lesson_14B
//
//  Created by Danila Dudkin on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {

    var n = 0
    
    @IBOutlet weak var TableView: UITableView!
    
    
    @IBAction func pushAddAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Create new item", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textFieldOne) in
            textFieldOne.placeholder = "New item name"
        }
        alertController.addTextField { (textFieldTwo) in
            textFieldTwo.placeholder = "Time"
        }
        
        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
        }
        
        let alertAction2 = UIAlertAction(title: "Create", style: .cancel) { (alert) in
            let newItemOne = alertController.textFields![0].text
            let newItemTwo = alertController.textFields![1].text
            taskB.shared.addItem(newItemOne!, Int(newItemTwo!) ?? 0, 0)
            self.TableView.reloadData()
        }
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        n = 1
        taskB.shared.addItem("", 0, 1)
        
        TableView.tableFooterView = UIView()
        TableView.backgroundColor = UIColor.groupTableViewBackground
//        taskB.shared.udalit()
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDeals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let deals = tableDeals [indexPath.row]
        let times = tableTime [indexPath.row]
        let done = tableDone [indexPath.row]

        let check = "check.png"
        let uncheck = "uncheck.png"
        
        if done == true {
            cell.imageView?.image = UIImage(named: check)
        } else{
            cell.imageView?.image = UIImage(named: uncheck)
        }
        cell.dealsLabel.text = "\(deals)"
        cell.timeLabel.text = "\(times)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        if taskB.shared.changeState(at: indexPath.row){
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
        
        let check = "check.png"
        let uncheck = "uncheck.png"
        
        taskB.shared.changeState(indexPath.row)

        
        TableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskB.shared.removeItem(at: indexPath.row)
            TableView.reloadData()
        }
    }
    

    
}
