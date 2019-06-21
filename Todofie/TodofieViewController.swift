//
//  TodofieViewController.swift
//  Todofie
//
//  Created by Vikas R S on 6/20/19.
//  Copyright © 2019 Vikas Radhakrishna Shetty. All rights reserved.
//

import UIKit

class TodofieViewController: UITableViewController {
    
    var toDoListItem = ["Vikas", "Egg", "Sambar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        
        cell.textLabel?.text = toDoListItem[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let accessoryType = tableView.cellForRow(at: indexPath)?.accessoryType
        
        if (accessoryType == UITableViewCell.AccessoryType.none){
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    
    @IBAction func addToDoItem(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title:"Add To List Item", message:"", preferredStyle:.alert)
        
        let alertAction = UIAlertAction(title:"Add Item", style:.default) { (action) in
    
            if let textValue = textField.text{
                
                if(textValue.count != 0)
                {
                    self.toDoListItem.append(textValue)
                    self.tableView.reloadData()
                }

            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter the To Do Item here"
            textField = alertTextField
        }
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    

}

