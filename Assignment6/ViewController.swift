//
//  ViewController.swift
//  Assignment6
//
//  Created by Thet Hlaing Phyo on 11/11/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var myPickerView: UIPickerView!
   
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var postalCodeTextField: UITextField!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var AddressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var myCountryLabel: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var tennisRadioButton: UIButton!
    
    @IBOutlet weak var hockeyRadioButton: UIButton!
    @IBOutlet weak var footBallRadioButton: UIButton!
    @IBOutlet weak var shuttleRadioButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    
    var country_list = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        footBallRadioButton.setImage(UIImage.init(named: "radio-button-unchecked"), for: .normal)
        footBallRadioButton.setImage(UIImage.init(named: "radio-button-checked"), for: .selected)
        hockeyRadioButton.setImage(UIImage.init(named: "radio-button-unchecked"), for: .normal)
        hockeyRadioButton.setImage(UIImage.init(named: "radio-button-checked"), for: .selected)
        tennisRadioButton.setImage(UIImage.init(named: "radio-button-unchecked"), for: .normal)
        tennisRadioButton.setImage(UIImage.init(named: "radio-button-checked"), for: .selected)
        shuttleRadioButton.setImage(UIImage.init(named: "radio-button-unchecked"), for: .normal)
        shuttleRadioButton.setImage(UIImage.init(named: "radio-button-checked"), for: .selected)
        // Do any additional setup after loading the view.
        termsButton.setImage(UIImage.init(named: "radio-button-unchecked"), for: .normal)
        termsButton.setImage(UIImage.init(named: "radio_button_checked_with_tick"), for: .selected)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Number of columns of data
    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country_list.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country_list[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myCountryLabel.text = String(country_list[row])
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        if ((firstNameTextField.text!.isEmpty || lastNameTextField.text!.isEmpty || phoneTextField.text!.isEmpty || emailTextField.text!.isEmpty || AddressTextField.text!.isEmpty || cityTextField.text!.isEmpty || regionTextField.text!.isEmpty || postalCodeTextField.text!.isEmpty) || (footBallRadioButton.isSelected == false && hockeyRadioButton.isSelected == false && tennisRadioButton.isSelected == false && shuttleRadioButton.isSelected == false)) {
            let dialogMessage = UIAlertController(title: "Attention", message: "Please fill all the details.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) {(action) in
                self.dismiss(animated: true)
            }
            dialogMessage.addAction(action)
            self.present(dialogMessage, animated: true, completion: nil)
            
        }
        else
        {
            if termsButton.isSelected == false {
                let alert = UIAlertController(title: "Attention", message: "Please agree to service agreements.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { (action) in
                    self.dismiss(animated: true)
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            else {
                self.successLabel.text = "Data has been sent successfully."
            }
        }
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        if sender == footBallRadioButton {
            footBallRadioButton.isSelected = true
            hockeyRadioButton.isSelected = false
            tennisRadioButton.isSelected = false
            shuttleRadioButton.isSelected = false
        }
        else if sender == hockeyRadioButton {
            hockeyRadioButton.isSelected = true
            footBallRadioButton.isSelected = false
            tennisRadioButton.isSelected = false
            shuttleRadioButton.isSelected = false
        }
        else if sender == tennisRadioButton {
            tennisRadioButton.isSelected = true
            footBallRadioButton.isSelected = false
            hockeyRadioButton.isSelected = false
            shuttleRadioButton.isSelected = false
        }
        else {
            shuttleRadioButton.isSelected = true
            footBallRadioButton.isSelected = false
            hockeyRadioButton.isSelected = false
            tennisRadioButton.isSelected = false
            
        }
    }
    
    @IBAction func termsButtonTapped(_ sender: UIButton) {

        if sender == termsButton && termsButton.isSelected == false {
            termsButton.isSelected = true
        }
        else {
            termsButton.isSelected = false
        }
    }
}

