//
//  DatailViewController.swift
//  EmployeeInfoDemo
//
//  Created by vishnu saini on 10/02/22.
//

import UIKit
import CoreData

class DatailViewController: UIViewController {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblDesg: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lbleducation: UILabel!
        var empolyee: Employee!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        lblname.text = empolyee?.emoname
        lblDesg.text = empolyee?.empdesiganation
        lblMobile.text = empolyee?.empmobile
        lblEmail.text = empolyee?.empemail
        lblcity.text = empolyee?.empcity
        lblGender.text = empolyee?.empgender
        lbleducation.text = empolyee?.empeducation
     }
}
