//
//  SignUpViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/3/25.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var signUpContainerView: UIView!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var passwordConfirmTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!

    var isChecked = false // ✅ Checkbox state
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("✅ SignUpViewController Loaded") // Debug log

        setupUI()
    }

    private func setupUI() {
        signUpContainerView.layer.cornerRadius = 10
        view.backgroundColor = UIColor.lightGray
        
        checkBoxButton.layer.cornerRadius = 5
        checkBoxButton.layer.borderWidth = 1
        checkBoxButton.layer.borderColor = UIColor.systemBrown.cgColor

        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.systemBrown.cgColor

        setupTextFields()
        setupCheckBox()
        setupButtonExclusivity()
    }

    private func setupTextFields() {
        emailTextfield.layer.cornerRadius = 5
        emailTextfield.layer.borderWidth = 1
        emailTextfield.layer.borderColor = UIColor.darkGray.cgColor
        emailTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextfield.frame.height))
        emailTextfield.leftViewMode = .always

        passwordTextfield.layer.cornerRadius = 5
        passwordTextfield.layer.borderWidth = 1
        passwordTextfield.layer.borderColor = UIColor.darkGray.cgColor
        passwordTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextfield.frame.height))
        passwordTextfield.leftViewMode = .always

        passwordConfirmTextfield.layer.cornerRadius = 5
        passwordConfirmTextfield.layer.borderWidth = 1
        passwordConfirmTextfield.layer.borderColor = UIColor.darkGray.cgColor
        passwordConfirmTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordConfirmTextfield.frame.height))
        passwordConfirmTextfield.leftViewMode = .always
    }

    private func setupCheckBox() {
        checkBoxButton.setImage(UIImage(systemName: "square"), for: .normal)
        checkBoxButton.tintColor = .systemBrown

        // ✅ Set fixed size for checkbox button
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        checkBoxButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkBoxButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func setupButtonExclusivity() {
        signUpButton.isExclusiveTouch = true
        checkBoxButton.isExclusiveTouch = true
    }

    @IBAction func didTapCheckBox(_ sender: UIButton) {
        isChecked.toggle()
        
        let imageName = isChecked ? "checkmark.square.fill" : "square"
        checkBoxButton.setImage(UIImage(systemName: imageName), for: .normal)
        
        checkBoxButton.tintColor = .systemBrown
    }

    @IBAction func didTapSignUpButton(_ sender: Any) {
        if !isChecked {
            print("⚠️ You must agree to Privacy and Policy before signing up.")
            return
        }

        guard let email = emailTextfield.text, !email.isEmpty else {
            print("⚠️ Please enter email address")
            return
        }
        guard let password = passwordTextfield.text, !password.isEmpty else {
            print("⚠️ Please enter password")
            return
        }
        guard let passwordConfirm = passwordConfirmTextfield.text, !passwordConfirm.isEmpty else {
            print("⚠️ Please enter confirm password")
            return
        }

        print("✅ Email: \(email)")
        print("✅ Password: \(password)")
        print("✅ Confirm Password: \(passwordConfirm)")
        print("✅ Privacy Policy Accepted")

        // ✅ Navigate to OTPViewController
        let storyboard = UIStoryboard(name: "OTP", bundle: nil)
        if let otpVC = storyboard.instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController {
            otpVC.modalPresentationStyle = .fullScreen
            self.present(otpVC, animated: true, completion: nil)
        }
    }

}
