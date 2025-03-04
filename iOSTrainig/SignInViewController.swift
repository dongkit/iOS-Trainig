//
//  SignInViewController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/3/25.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var popUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI Styling
        loginContainerView.layer.cornerRadius = 10
        view.backgroundColor = UIColor.lightGray
        
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.systemBrown.cgColor
        
        setupTextFields()
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
    }

    @IBAction func didTapLoginButton(_ sender: Any) {
        guard let email = emailTextfield.text, !email.isEmpty else {
            print("⚠️ Please enter an email address")
            return
        }
        
        guard let password = passwordTextfield.text, !password.isEmpty else {
            print("⚠️ Please enter a password")
            return
        }
        
        print("✅ Email: \(email)")
        print("✅ Password: \(password)")
    }
    
    @IBAction func didTapSignUpButton(_ sender: Any) {
        print("➡️ Navigating to Sign Up Screen") // Debug log

        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        
        // Ensure correct identifier and type casting
        guard let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {
            print("❌ SignUpViewController not found in SignUp.storyboard")
            return
        }

        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true) {
            print("✅ SignUpViewController Presented") // Debug log
        }
    }
    
    @IBAction func didTapPopUpButton(_ sender: Any) {
        let sampleVC = DashboardViewController()
        self.navigationController?.pushViewController(sampleVC, animated: true)
    }
}
