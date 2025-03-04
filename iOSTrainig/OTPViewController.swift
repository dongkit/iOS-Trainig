//
//  SignUpViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/3/25.
//

import UIKit

class OTPViewController: UIViewController, UITextFieldDelegate  {
    @IBOutlet weak var otpStackView: UIStackView!
    
    var otpTextFields: [UITextField] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOTPFields()
    }
    
    private func setupOTPFields() {
        otpStackView.spacing = 10 // Adjust spacing if needed
        
        for i in 0..<4 { // 4-digit OTP
            let textField = createOTPTextField()
            textField.tag = i // Identify each field
            otpTextFields.append(textField)
            otpStackView.addArrangedSubview(textField)
        }
    }
    
    private func createOTPTextField() -> UITextField {
            let textField = UITextField()
            textField.delegate = self
            textField.textAlignment = .center
            textField.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            textField.keyboardType = .numberPad
            textField.layer.cornerRadius = 5
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.darkGray.cgColor
            textField.widthAnchor.constraint(equalToConstant: 50).isActive = true
            textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            return textField
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            let currentIndex = textField.tag
            if let text = textField.text, text.count > 1 {
                textField.text = String(text.prefix(1)) // Ensure only 1 character
            }
            
            if textField.text?.isEmpty == false {
                if currentIndex < otpTextFields.count - 1 {
                    otpTextFields[currentIndex + 1].becomeFirstResponder() // Move to next
                } else {
                    textField.resignFirstResponder() // Close keyboard on last field
                }
            }
        }
        
        // Handle backspace key
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentIndex = textField.tag
            if string.isEmpty, range.length == 1 { // Backspace pressed
                textField.text = ""
                if currentIndex > 0 {
                    otpTextFields[currentIndex - 1].becomeFirstResponder()
                }
                return false
            }
            return true
        }
}
