//
//  AddViewController.swift
//  ToDo
//
//  Created by Neha Gupta on 03/03/21.
//

import UIKit

class AddViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var txtTaskName:UITextField!
    @IBOutlet weak var txtDescription:UITextView!
    @IBOutlet weak var lblTodayDate:UILabel!
    @IBOutlet weak var lblTomorrowDate:UILabel!
    //@IBOutlet weak var lblUserSelectedDate:UILabel!
    @IBOutlet weak var btnClose:UIButton!
    @IBOutlet weak var uvDate:UIView!
    @IBOutlet weak var userSelectedDatePicker:UIDatePicker!
    
    //MARK: - Variable's & Constants
    let date = Date()
    let formatter = DateFormatter()
    let kDescriptionPlacholder  = "Description"
    let kDateFormat = "dd/MM/yyyy"
    var selectedDate:Date? = nil
    var refreshTaskTableView:UpdateMainView?
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = kDateFormat
        txtDescription.delegate = self
        txtTaskName.delegate = self
        txtTaskName.layer.borderWidth = 1.5
        let dayAfter =  Calendar.current.date(byAdding: .day, value: 2, to: Date())!
        
        userSelectedDatePicker.setDate(dayAfter, animated: false)
        roundedView()
        circleCloseButton()
        addPlaceholderInDescription()
    }
    
    //MARK: - Functionality
    @IBAction func onTapAddButton(_ sender:Any) {
        validateInput()
    }
    @IBAction func onUserSelectedTap(_ sender: Any) {
        clearLabel()
        selectedDate = userSelectedDatePicker.date
        print("User selected \(String(describing: selectedDate))")
    }
    
    @IBAction func onTabTodayDate(_ sender:Any) {
        
        clearLabel()
        selectedDate = date
        print("User selected \(String(describing: selectedDate))")
        lblTodayDate.text = formatter.string(from: date)
    }
    
    @IBAction func onTapTomorrowDate(_ sender: Any) {
        clearLabel()
        let tommorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: date)
        selectedDate = tommorrowDate
        lblTomorrowDate.text = formatter.string(from: tommorrowDate ?? date)
    }
    
    
    @IBAction func onCloseTap(_ sender:Any) {
        goBack()
    }
    
    //MARK: - Helper
   
    
    func validateInput() {
        if (txtTaskName.text == "") {
            txtTaskName.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            txtTaskName.setErrorBorderOnlyWith(color: UIColor.red.cgColor)
        }else if txtDescription.text.isEmpty || txtDescription.text == kDescriptionPlacholder{
            txtDescription.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
            txtDescription.setErrorBorderOnlyWith(color: UIColor.red.cgColor)
        }else if selectedDate == nil {
            Toast.showToast(controller: self, message: "Please select Date")
        }else {
            saveTask()
        }
    }
    
    func clearLabel() {
        lblTomorrowDate.text = String()
        lblTodayDate.text = String()
    }
    
    func addPlaceholderInDescription() {
        txtDescription.text = kDescriptionPlacholder
        txtDescription.textColor = UIColor.lightGray
        txtDescription.layer.borderWidth = 1.5
        txtDescription.layer.borderColor = UIColor.black.cgColor
    }
    
    func roundedView() {
        uvDate.layer.cornerRadius = 10
        
    }
    
    func circleCloseButton() {
        btnClose.layer.cornerRadius = 25
    }
    
    
    //MARK: -  Save Data in Core data
    func saveTask() {
        let objTaskDataModel = Task()
        let taskName = txtTaskName.text!
        let taskDescription = txtDescription.text!
        
        let result = objTaskDataModel.saveTask(name: taskName, description: taskDescription, date: selectedDate ?? Date())
        
        if result.0 == NetworkHelper.RequestStatus.Success.rawValue{
            Toast.showToast(controller: self, message: "Save Successfully")
            goBack()
        }else {
            Toast.showToast(controller: self, message: result.1)
        }
        
    }
    
    //MARK:- Navigation
    func goBack() {
        self.dismiss(animated: true, completion: {() -> Void in
            self.refreshTaskTableView?.refreshTableViewWithNewData()
        })
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK: - Text View Delegate Implementation
extension AddViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.layer.borderColor = UIColor(named: "Main")?.cgColor
        textView.layer.borderWidth = 1.5
        if textView.textColor == UIColor.lightGray ||  textView.text == kDescriptionPlacholder{
            textView.text = ""
            textView.textColor = UIColor.black
            
            
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1.5
        if textView.text.isEmpty {
            textView.text = kDescriptionPlacholder
            textView.textColor = UIColor.lightGray
        }
    }
}

extension AddViewController :UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "Main")?.cgColor
        textField.layer.borderWidth = 1.5
        
    }
    
    func textFieldDidEndEditing(_ textField:UITextField){
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.5
    }
}
