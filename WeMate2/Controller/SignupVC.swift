//
//  SignupVC.swift
//  divide
//
//  Created by Adil Jiwani on 2017-12-08.
//  Copyright © 2017 Adil Jiwani. All rights reserved.
//

import UIKit
import EasyPeasy

class SignupVC: UIViewController {
    
    let nameTextField = UnderlineTextField()
    let emailTextField = UnderlineTextField()
    let passwordTextField = UnderlineTextField()
    let signupButton = RoundedButton()
    let logoImageView = UIImageView()
    let loginButton = UIButton()
    let titleLabel = UILabel()
    let errorLabel = UILabel()
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        let gradientView = GradientView()
        view.addSubview(gradientView)
        gradientView <- [Edges()]
        gradientView.topColor = UI.Colours.rosePink
        gradientView.bottomColor = UI.Colours.peachyPink
        
        setupTitle()
        setupLogo()
        setupNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupSignupButton()
        setupBackButton()
    }
    
    func setupBackButton() {
        view.addSubview(backButton)
        backButton.setImage(UIImage(named: "left-arrow"), for: .normal)
        backButton.addTarget(self, action: #selector(backPressed(_:)), for: .touchUpInside)
        backButton <- [
            Top(40),
            Left(25),
            Size(45)
        ]
        
    }
    
    func setupTitle() {
        view.addSubview(titleLabel)
        titleLabel.text = "Welcome to"
        titleLabel.font = UI.Font.medium(25)
        titleLabel.textColor = UI.Colours.white
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel <- [Top(50), CenterX()]
    }
    
    func setupLogo() {
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "logo")
        logoImageView <- [
            Width(100),
            Top(10).to(titleLabel),
            CenterX()
        ]
    }
    
    func setupNameTextField() {
        view.addSubview(nameTextField)
        let data = TextFieldEntryData(title: "Name", placeholder: "John")
        nameTextField.configure(data)
        nameTextField.easy.layout(Top(100).to(titleLabel), Left(30), Right(30))
    }
    
    func setupEmailTextField() {
        view.addSubview(emailTextField)
        let data = TextFieldEntryData(title: "Email address", placeholder: "hello@divide.com")
        emailTextField.configure(data)
        emailTextField.easy.layout(Top(16).to(nameTextField), Left(30), Right(30))
    }
    
    func setupPasswordTextField() {
        view.addSubview(passwordTextField)
        let data = TextFieldEntryData(title: "Password", placeholder: "********")
        passwordTextField.configure(data)
        passwordTextField.easy.layout(Top(16).to(emailTextField), Left(30), Right(30))
    }
    
    func setupSignupButton() {
        view.addSubview(signupButton)
        signupButton.backgroundColor = UI.Colours.pink
        signupButton.titleLabel?.textColor = UI.Colours.white
        signupButton.titleLabel?.font = UI.Font.demiBold(18)
        signupButton.setTitle("SIGN UP", for: .normal)
        signupButton.cornerRadius = 25
        signupButton.addTarget(self, action: #selector(signUpPressed(_:)), for: .touchUpInside)
        signupButton.easy.layout(Bottom(15).to(loginButton), Left(50), Right(50), Height(50))
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        let loginString = NSMutableAttributedString(string: "Have an account? LOG IN")
        loginString.addAttributes([NSAttributedStringKey.foregroundColor: UI.Colours.lightGrey, NSAttributedStringKey.font: UI.Font.regular(15)], range: NSMakeRange(0, loginString.length - 7))
        loginString.addAttributes([NSAttributedStringKey.foregroundColor: UI.Colours.white, NSAttributedStringKey.font: UI.Font.demiBold(15)], range: NSMakeRange(loginString.length - 7, 7))
        loginButton.setAttributedTitle(loginString, for: .normal)
        loginButton.addTarget(self, action: #selector(loginPressed(_:)), for: .touchUpInside)
        loginButton <- [
            Bottom(25),
            CenterX()
        ]
    }
    
    @objc func loginPressed(_ sender: Any) {
        dismissDetail()
    }

    
    @objc func backPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @objc func signUpPressed(_ sender: Any) {
        if nameTextField.textField.text != "" && emailTextField.textField.text != "" && passwordTextField.textField.text != "" {
        let homeViewController = HomeVC()
        if emailTextField.textField.text != nil && passwordTextField.textField.text != nil && nameTextField.textField.text != nil {
        AuthService.instance.registerUser(withEmail: self.emailTextField.textField.text!, andPassword: self.passwordTextField.textField.text!, name: nameTextField.textField.text!, userCreationComplete: { (success, registrationError) in
            if success {
                AuthService.instance.loginUser(withEmail: self.emailTextField.textField.text!, andPassword: self.passwordTextField.textField.text!, loginComplete: { (success, nil) in
                    self.presentDetail(homeViewController)
                    UIApplication.shared.statusBarStyle = .lightContent
                })
            } else {
                if let error = registrationError?.localizedDescription  {
                print(error)
                    self.errorLabel.isHidden = false
                    if error == "The password must be 6 characters long or more." {
                        self.errorLabel.text = error
                    } else if error == "The email address is badly formatted." {
                        self.errorLabel.text = "Please enter a valid email address."
                    } else if error == "The email address is already in use by another account." {
                        self.errorLabel.text = "This user already has a divide account. Please log in."
                    }
                }
            }
        })
        }
        } else {
            
        }
    }
    
}

extension SignupVC: UITextFieldDelegate {
    
}
