//
//  Category+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by Rahil Patel on 6/27/19.
//  Copyright © 2019 Rahil Patel. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    var expenses: [Expense]? {
        return self.rawExpenses?.array as? [Expense]
    }
    
    convenience init?(title: String) {
        let appDelegate = UIApplication.shared.delegate as? appDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            else {
                return nil
        }
        
        self.init(entity: Category.entity(), insertInto: context)
    
        self.title = title
    }
}
