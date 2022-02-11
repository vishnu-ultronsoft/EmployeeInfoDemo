//
//  ViewController.swift
//  EmployeeInfo
//
//  Created by vishnu saini on 09/02/22.
//

import UIKit
import CloudKit
import CoreData

class ViewController: UIViewController {
    
    let city = ["Jaipur","Kota","Jujrat","Mumbai","colcota"]
    var pickerView = UIPickerView()
    var gender = ""
    var qualifications = [String]()
    
    @IBOutlet weak var txtEmpName: UITextField!
    @IBOutlet weak var txtEmpDesignation: UITextField!
    @IBOutlet weak var txtEmpMobilNo: UITextField!
    @IBOutlet weak var txtEmpEmail: UITextField!
    @IBOutlet weak var txtEmpCity: UITextField!
    
    @IBOutlet weak var lblError: UILabel!
    
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pickerView.delegate = self
        pickerView.dataSource = self
        txtEmpCity.inputView = pickerView
        
        
        
        
    }
    
    
    //MARK:-  Radio button
    

    @IBAction func btnRadioGender(_ sender: UIButton) {
      
            if sender.tag == 1 {
                self.gender = "Male"
                btnMale.isSelected = true
                btnFemale.isSelected = false
            }
            else if sender.tag == 2 {
                self.gender = "Female"
                btnFemale.isSelected = true
                btnMale.isSelected = false
                
            }

    }
    
    //MARK:-  Check box button
    
    
    @IBAction func btnCheckBoxBachlor(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            lblError.text = ""
            if qualifications.contains("Bachlor"){
                qualifications.removeAll(where: {$0 == "Bachlor"})
                    }
        }
        else {
            sender.isSelected = true
           // lblError.text = "Bachlor"
            qualifications.append("Bachlor")
        }
    }
    @IBAction func btnCheckBoxMaster(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            //lblError.text = "Master"
            if qualifications.contains("Master"){
                           qualifications.removeAll(where: {$0 == "Master"})
                               }
        }
        else {
            sender.isSelected = true
            //lblError.text = lblError.text! + "Master"
            qualifications.append("Master")
        }
    }
    @IBAction func btnCheckBoxMPhil(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            //lblError.text = "Bachlor,Master"
            if qualifications.contains("MPhil"){
                           qualifications.removeAll(where: {$0 == "MPhil"})
                               }
            
        }
        else {
            sender.isSelected = true
            lblError.text = lblError.text! + "M.Phil"
            qualifications.append("MPhil")
        }
    }
    @IBAction func btnCheckBoxPhd(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            //lblError.text = "Bachlor,Master,M.Phil"
            if qualifications.contains("Phd"){
                           qualifications.removeAll(where: {$0 == "Phd"})
                               }
        }
        else {
            sender.isSelected = true
            //lblError.text = lblError.text! + "Phd"
            qualifications.append("Phd")
        }
    }
    
    
    //MARK:-  Submit button
    @IBAction func btnSubmit(_ sender: UIButton) {
        
        guard let name = txtEmpName.text,
              name != "",
              let desgnation = txtEmpDesignation.text,
              desgnation != "",
              let mobileno = txtEmpMobilNo.text,
              mobileno != "",
              let email = txtEmpEmail.text,
              email != "",
              let city = txtEmpCity.text,
              city != ""
                
        else {
            lblError.text = "Please fill out all fields"
            return
    }
        
        if(btnMale.isSelected == false && btnFemale.isSelected == false)
          {
            lblError.text = "Please select Gender"
          }
          else
          {
              lblError.text = "Successfully select Gender"

          }

        
        var dict = ["name":txtEmpName.text,"desganation":txtEmpDesignation.text,"mobile":txtEmpMobilNo.text,"email":txtEmpEmail.text,"city":txtEmpCity.text]
        dict["gender"] = self.gender
        dict["education"] = self.qualifications.joined(separator: ", ")
        
//        "gender":title
        
        DatabsaeHelper.shareInstance.save(object: dict as! [String:String])
        
    }
    
    
    
    
    
}


//MARK:-  picker view

extension ViewController:  UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return city[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtEmpCity.text = city[row]
        txtEmpCity.resignFirstResponder()
    }
}
