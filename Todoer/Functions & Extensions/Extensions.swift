//
//  Extensions.swift
//  Todoer
//
//  Created by Noah Wilder on 2018-03-04.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
import SwipeCellKit


//_____________________________________________
//MARK: - My Colours Extension
    extension UIColor {
        struct myColours {
            
            static let deleteRed = #colorLiteral(red: 0.9914426208, green: 0.2377755642, blue: 0.1868577898, alpha: 1) // Background for delete swipe button
            static let renameYellow = #colorLiteral(red: 1, green: 0.8319068551, blue: 0, alpha: 1) // Background colour for rename swipe button
            static let todoBlue = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1) // Theme Colour
            static let backBlue = UIColor.myColours.todoBlue.darken(byPercentage: 0.3) // Background colour for CategoryViewController
            static let contrastLight = UIColor.flatWhite
            static let contrastDark = UIColor(hexString: "#262626")
            
        }
    }


//_____________________________________________
//MARK: - URL to String Extension
    extension URL {
        func asString() -> String {
            var url = "\(self)"
            url.removeFirst(7)
            return url
        }
    }

//_____________________________________________
//MARK: - Add Line at Beginning & End of String
    extension String {
        func addSpacing() -> String{
            let spacedString = "\n\(self)\n"
            return spacedString
        }
    }



//_____________________________________________
//MARK: - Contrast Colour

extension UIColor {
    
    func contrastingColour() -> UIColor {
        let newColour = ContrastColorOf(self, returnFlat: true)
        return newColour
    }
    
}





//_____________________________________________
//MARK: - Number of Rows in TableView

extension UITableView {
    func numberOfRows() -> Int {
        return numberOfRowsInTableView(in: self)
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





