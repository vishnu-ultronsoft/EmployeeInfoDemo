//
//  DatabaseHelper.swift
//  EmployeeInfoDemo
//
//  Created by vishnu saini on 10/02/22.
//

import Foundation
import CoreData
import UIKit

class DatabsaeHelper {
    
    static var shareInstance = DatabsaeHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]) {
        let empolyee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!) as! Employee
        empolyee.emoname = object["name"]
        empolyee.empdesiganation = object["desganation"]
        empolyee.empmobile = object["mobile"]
        empolyee.empemail = object["email"]
        empolyee.empcity = object["city"]
        empolyee.empgender = object["gender"]
        empolyee.empeducation = object["education"]
        do{
            try context?.save()
        }catch{
            print("Data is note Save")
        }

    }
    
    func getEmployeeData() -> [Employee] {
        var employee = [Employee]()
        
        let fatchRequest = NSFetchRequest<NSManagedObject>(entityName: "Employee")
        do{
            employee = try context?.fetch(fatchRequest) as! [Employee]
            print(employee)
        }catch {
            print("can not get data")
        }
        return employee
    }
}
