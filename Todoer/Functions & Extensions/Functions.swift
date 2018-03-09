//
//  Functions.swift
//  Todoer
//
//  Created by Noah Wilder on 2018-03-03.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
import SwipeCellKit

let realm = try! Realm()

//_______________________________
//MARK: - Change status bar style
    func changeStatusBarStyle(categoryColour colourHexCode: String, isInitialVC: Bool = false) {
        
        if isInitialVC == false {
            guard let colour = UIColor(hexString: colourHexCode) else { fatalError("changeStatusBarStyle() --> Error extrapolating colour from hex code.".addSpacing()) }
            let colourForCheck = ContrastColorOf(colour, returnFlat: true)
            
            if colourForCheck.hexValue() == "#262626" {
                UIApplication.shared.statusBarStyle = .default
            } else {
                UIApplication.shared.statusBarStyle = .lightContent
            }
        } else {
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }





//_____________________________________
//MARK: - Update View Controller Colour

    func updateColourVC(withCode colourHexCode: String, navigationController: UINavigationController?, tableView: UITableView, isInitialVC: Bool = false) {
        
        guard let navBar = navigationController?.navigationBar else { fatalError("updateColorVC() --> Error, navigation controller does not exist.".addSpacing()) }
        
        if isInitialVC == false {
            guard let navBarColour = UIColor(hexString: colourHexCode) else { fatalError() }
            
            let contrastColour : UIColor = ContrastColorOf(navBarColour, returnFlat: true)
            
            navBar.barTintColor = navBarColour // Navigation Bar Background Colour
            
            navBar.tintColor = contrastColour // Navigation Bar Button Colour
            navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white] // Small Title Colour
            navBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white] // Large Title Colour
            
            if contrastColour.hexValue() == "#262626" { // Status Bar Style
                UIApplication.shared.statusBarStyle = .default // Dark Style
            } else {
                UIApplication.shared.statusBarStyle = .lightContent // Light Style
            }
            
            tableView.backgroundColor = navBarColour // TableView Background Colour
            
            
            
        } else {
            let backgroundColour = UIColor.myColours.backBlue // Darkened Theme (Blue) Colour
            let foregroundColour = UIColor.myColours.todoBlue // Main Theme (Blue) Colour
            let contrastColour = ContrastColorOf(foregroundColour, returnFlat: true) // UIColor.flatWhite
                
            
            navBar.barTintColor = foregroundColour // Navigation Bar Background Colour
            
            navBar.tintColor = contrastColour // Navigation Bar Button Colour
            navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : contrastColour] // Small Title Colour
            navBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : contrastColour] // Large Title Colour
            
            UIApplication.shared.statusBarStyle = .lightContent // Status Bar Style (Light)
            
            tableView.backgroundColor = backgroundColour // TableView Background Colour
            
            
        }
    }





//_____________________________________________
//MARK: - Realm Delete Category

func realmDeleteCategory(at indexPath: IndexPath, from categories: Results<Category>?, completion : (() -> Void)?) {
    
    if let currentCategory = categories?[indexPath.row] {
        do {
            try realm.write {
                realm.delete(currentCategory)
                completion?()
            }
            
        } catch {
            print("realmDeleteCategory --> Error deleting current category:\t \(error)".addSpacing())
            completion?()
        }
    }
}

//func realmDeleteCategory(at indexPath: IndexPath, from currentCategory: Results<Category>.Element) {
//
//    do {
//        try realm.write {
//            realm.delete(currentCategory)
//        }
//    } catch {
//        print("realmDeleteCategory --> Error deleting current category:\t \(error)".addSpacing())
//    }
//}



//_____________________________________________
//MARK: - Get Number of Rows in TableView Function

func numberOfRowsInTableView(`in` tableView: UITableView) -> Int {
    if tableView.numberOfSections == 1 {
        let rowCount : Int = tableView.numberOfRows(inSection: 0)
        return rowCount
    } else {
        var rowCount : Int = 0
        for section in 0...tableView.numberOfSections - 1 {
            rowCount += tableView.numberOfRows(inSection: section)
        }
        return rowCount
    }
    
}


//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark






//_____________________________________________
//MARK: - Empty Mark





























