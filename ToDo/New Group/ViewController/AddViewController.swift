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
    @IBOutlet weak var lblUserSelectedDate:UILabel!
    @IBOutlet weak var btnClose:UIButton!
    @IBOutlet weak var uvDate:UIView!
    
    
    //MARK: - Variable's & Constants
    let date = Date()
    let formatter = DateFormatter()
    let kDescriptionPlacholder  = "Description"
    let kDateFormat = "dd/MM/yyyy"
    //let selectedDate:Date
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = kDateFormat
        txtDescription.delegate = self
        roundedView()
        circleCloseButton()
        addPlaceholderInDescription()
    }
    
    //MARK: - Functionality
    @IBAction func onTapAddButton(_ sender:Any) {
        validateInput()
    }
    
    @IBAction func onTabTodayDate(_ sender:Any) {
        clearLabel()
        lblTodayDate.text = formatter.string(from: date)
    }
    
    @IBAction func onTapTomorrowDate(_ sender: Any) {
        clearLabel()
        let tommorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: date)
        lblTomorrowDate.text = formatter.string(from: tommorrowDate ?? date)
    }
    
    @IBAction func onTapSelectDate(_ sender: Any){
        clearLabel()
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
        }else {
            
        }
    }
    
    func clearLabel() {
        lblTomorrowDate.text = String()
        lblTodayDate.text = String()
        lblUserSelectedDate.text = String()
    }
    
    func addPlaceholderInDescription() {
        txtDescription.text = kDescriptionPlacholder
        txtDescription.textColor = UIColor.lightGray
        txtDescription.layer.borderWidth = 1.0
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
        
    }
    
    //MARK:- Navigation
    func goBack() {
        self.dismiss(animated: true, completion: nil)
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
        if txtDescription.textColor == UIColor.lightGray ||  txtDescription.text == kDescriptionPlacholder{
            txtDescription.text = ""
            txtDescription.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if txtDescription.text.isEmpty {
            txtDescription.text = kDescriptionPlacholder
            txtDescription.textColor = UIColor.lightGray
        }
    }
}
