//
//  Expense+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by Rahil Patel on 6/27/19.
//  Copyright © 2019 Rahil Patel. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, amount: Double, date: Date?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
   
        guard let context = appDelegate?.persistenetContainer.viewContext else {
            return nil
        }
    
        self.init(entity: Expense.entity(), insertInto: context)
        
        self.name = name
        self.amount = amount
        self.date = date
    }
    
}
