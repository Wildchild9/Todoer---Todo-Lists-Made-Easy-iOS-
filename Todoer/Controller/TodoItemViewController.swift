//
//  TableViewController.swift
//  Todoer
//
//  Created by Noah Wilder on 2018-03-03.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
import SwipeCellKit

class TodoItemViewController: UITableViewController, SwipeTableViewCellDelegate {
    
    // MARK: - Class Variables & Values
  
    var todoItems: Results<Item>?
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
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 19)
        
        return cell
    }
    
    // TODO: - Did Select Row at indexPath
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
    
    
//MARK: - Swipe Cell Delegate Methods
    
    // TODO: - Edit Actions for Row at indexPath
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        // Right Orientation
        if orientation == .right {
          //  let deleteAction = SwipteAction
            
        }
        
        
        
        
        // Configure actions for swipe cell
        
        return nil // FIXME: Change to return to the desired swipe cell actions depending on the orientation
    }
    
    
    // TODO: - Edit Action Options for Row at indexPath
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        
        let options = SwipeTableOptions()
        // Configure action options for swipe cell
        
        return options
    }
    
    
    
    
    
    
    
} // END OF CLASS //MARK: - End of Class

