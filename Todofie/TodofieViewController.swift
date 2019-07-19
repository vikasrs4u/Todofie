//
//  TodofieViewController.swift
//  Todofie
//
//  Created by Vikas R S on 6/20/19.
//  Copyright © 2019 Vikas Radhakrishna Shetty. All rights reserved.
//

import UIKit

class TodofieViewController: UITableViewController {
    
    
    var itemArray = [ToDoDataModel]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = ToDoDataModel()
        
        newItem.title = "Vikas"
        
        newItem.done = true
        
        itemArray.append(newItem)

       
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
  
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let accessoryType = itemArray[indexPath.row].done
            
        
        if (accessoryType == false){
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            itemArray[indexPath.row].done = true
            
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            itemArray[indexPath.row].done = false
        }
        
        saveItem()
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    
    @IBAction func addToDoItem(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title:"Add To List Item", message:"", preferredStyle:.alert)
        
        let alertAction = UIAlertAction(title:"Add Item", style:.default) { (action) in
    
            if let textValue = textField.text{
                
                if(textValue.count != 0){
                    
                    let newItem1 = ToDoDataModel()
                    
                    newItem1.title = textValue
                    
                    self.itemArray.append(newItem1)
                    
                    self.saveItem()
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
    
    
    func saveItem(){
        
        let encoder = PropertyListEncoder()
        
        do{
            let data = try encoder.encode(self.itemArray)
            
            try data.write(to: self.dataFilePath!)
        }
        catch{
            
            print("Error caused during encoding \(error)")
            
        }
        
        self.tableView.reloadData()
    }
    

}

