//
//  EmpListTableViewController.swift
//  EmployeeInfoDemo
//
//  Created by vishnu saini on 10/02/22.
//

import UIKit
import CoreData

class EmpListTableViewController: UITableViewController {
    var employee = [Employee]()

    override func viewDidLoad() {
        super.viewDidLoad()
        employee = DatabsaeHelper.shareInstance.getEmployeeData()
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let eventArrayItem = employee[indexPath.row]

            if editingStyle == .delete {
                context?.delete(eventArrayItem)

                do {
                    try context!.save()
                } catch let error as NSError {
                    print("Error While Deleting Note: \(error.userInfo)")
                }
            }
        self.tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  employee.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmpTableViewCell
        cell.lblName?.text = employee[indexPath.row].emoname
        cell.lblDesgination?.text = employee[indexPath.row].empdesiganation
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let datail: DatailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DatailViewController") as! DatailViewController
        datail.empolyee = employee[indexPath.row]
        print(self.employee[indexPath.row])
        
        self.navigationController?.pushViewController(datail, animated: true)
      
    }
    
    
    

}
