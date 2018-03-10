//
//  CategoriesViewController.swift
//  Todoer
//
//  Created by Noah Wilder on 2018-03-03.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
import SwipeCellKit

class CategoriesViewController: UITableViewController, SwipeTableViewCellDelegate {
    
// MARK: - Class Variables & Values
    
    var categories: Results<Category>?
  
    let realm = try! Realm()
    
    
    
    
    
// MARK: - View Methods
    
    // TODO: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.00
        
    }
    
    
    
    
    
    
    
// MARK: - TableView Datasource Methods
    
    //TODO: - Number of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // TODO: - Number of Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    // TODO: - Cell for Row at indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        // Configure the cell...
        
        cell.delegate = self
        
        return cell
    }
    
    // TODO: - Did Select Row at indexPath
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
    
    
//MARK: - Swipe Cell Delegate Methods
    
    // TODO: - Edit Actions for Row at indexPath
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
    
        guard let currentCategory = categories?[indexPath.row] else {
            fatalError("editActionsForRowAtIndexPath --> Error reading category for swipe actions".addSpacing())
        }
        
        // Configure actions for swipe cell
        if orientation == .right {
            
            let deleteAction = SwipeAction(style: .default, title: "Delete") { (action, indexPath) in
                
                self.deleteConfirmation(withName: currentCategory.name) { (deleteTapped) in
                    if deleteTapped {
                        print("Delete Cell \"\(tableView.cellForRow(at: indexPath)?.textLabel?.text ?? "Could not find title")\"".addSpacing())
                        realmDeleteCategory(at: indexPath, from: self.categories) {
                            action.fulfill(with: .delete)
                            tableView.reloadData()
                        }
                        
//                        indexPath.count
                    } else {
                        action.fulfill(with: .reset)
                    }
                }
            }
            
            deleteAction.image = UIImage(named: "delete-icon")
            deleteAction.backgroundColor = UIColor.myColours.deleteRed
    
            
            return [deleteAction]
            
        } else {
            
            let renameAction = SwipeAction(style: .default, title: "Rename") { (action, indexPath) in
                self.renameAlert(indexPath: indexPath)
            }
            
            
            renameAction.backgroundColor = UIColor.myColours.renameYellow
            renameAction.image = UIImage(named: "rename-icon1-small-white")
            
            
            return [renameAction]
        }
    }
    
    
    // TODO: - Edit Action Options for Row at indexPath
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        
        // Configure action options for swipe cell
       
        if orientation == .right {
            var options = SwipeTableOptions()
            options.expansionStyle = .fill
            return options
        } else {
            var options = SwipeTableOptions()
            // options.expansionStyle = .selection
            options.transitionStyle = .border
            return options
        }
    }
    
    
    
    
//MARK: - In-Class Functions:
    
    //_____________________________________________
    //MARK: - Delete Confirmation Alert Function
    
    func deleteConfirmation(withName categoryName: String, completion: @escaping (Bool) -> Void) {
        
        //        let confirmationMessage1 : String = "Are you sure you want to delete your category named \"\(categoryName)\"?"
        //        let confirmationMessage2 : String = "Are you sure you want to delete your category with the name \"\(categoryName)\"?"
        //        let confirmationMessage3 : String = "Are you sure you want to delete your \(categoryName) category?"
        //        let confirmationMessage4 : String = "Are you sure you want to delete \(categoryName)?"
        //        let confirmationMessage5 : String = "Are you sure you want to delete \(categoryName)? This action cannot be undone."
        //        let confirmationMessage6 : String = "Are you sure you want to proceed? This action cannot be undone."
        let confirmationMessage6 : String = "This action cannot be undone. Are you sure you want to proceed?"
        
        let alert = UIAlertController(title: "Delete \(categoryName)", message: confirmationMessage6, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (deleteAction) in
            alert.dismiss(animated: true, completion: nil)
            let deleteTapped = true
            completion(deleteTapped)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancelAction) in
            alert.dismiss(animated: true, completion: nil)
            let deleteTapped = false
            completion(deleteTapped)
        }
        
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    //_____________________________________________
    //MARK: - Delete Confirmation Alert Function
    
    func renameAlert(alertButton: String = "Rename", indexPath: IndexPath) {
        var textField = UITextField() // We use this textField as a local variable to store the inputted data from alertTextField
        
        guard let category = categories?[indexPath.row] else { fatalError("renameAlert() --> No category at indexPath.row in realm database") }
        
        let titleString : String = "Rename \(category.name)"
        let alert = UIAlertController(title: titleString, message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (cancelAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        let action = UIAlertAction(title: alertButton, style: .default) { (action) in
            // What will happen once the user clicks the Add Item button on our UIAlert
            
            if textField.text != "" {
                
                category.name = textField.text!
                self.tableView.reloadData()
                
            }
        }
        
        alert.addTextField { (alertTextField) in // You chose the name of the text field, in this case I chose alertTextField
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            // This allows alertTextField to be used at a wider scope and lets texField actually hold the inputted values
            
        }
        
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
    


} // END OF CLASS //MARK: - End of Class









