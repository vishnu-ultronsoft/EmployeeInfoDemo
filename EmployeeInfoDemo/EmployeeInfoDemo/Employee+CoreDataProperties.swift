//
//  Employee+CoreDataProperties.swift
//  EmployeeInfoDemo
//
//  Created by vishnu saini on 11/02/22.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var emoname: String?
    @NSManaged public var empcity: String?
    @NSManaged public var empdesiganation: String?
    @NSManaged public var empeducation: String?
    @NSManaged public var empemail: String?
    @NSManaged public var empgender: String?
    @NSManaged public var empmobile: String?

}

extension Employee : Identifiable {

}
