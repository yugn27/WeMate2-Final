//
//  AuthVC.swift
//  WeMate
//
//  Created by Yash Nayak on 09/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit
import EasyPeasy

class AuthVC: UIViewController {

    @IBOutlet weak var errorLbl: UILabel!
    let subtitleLabel = UILabel()
    let emailTextField = UnderlineTextField()
    let passwordTextField = UnderlineTextField()
    let loginButton = RoundedButton()
    let forgotPasswordButton = UIButton()
    let signUpButton = UIButton()
    let gradientView = GradientView()
    let logoImageView = UIImageView()
    let termsLabel = UILabel()
    
    @IBOutlet weak var backView: UIView!
    var offsetY:CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        
        
        view.addSubview(gradientView)
        gradientView <- [Edges()]
        gradientView.topColor = UI.Colours.grdOrange
        gradientView.bottomColor = UI.Colours.grdOrange2
        
        setupLogo()
        setupSubtitle()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupSignUpButton()
        
        
        
        // keyboard fix
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
    }
    
    
    
    
    
    func setupLogo() {
        view.addSubview(logoImageView)
        
        logoImageView.contentMode = .scaleAspectFill
        logoImageView <- [
            Top(50),
            CenterX()
        ]
    }
 

    
    func setupSubtitle() {
        view.addSubview(subtitleLabel)
        subtitleLabel.text = "WeMate"
        subtitleLabel.font = UI.Font.regular(22)
        subtitleLabel.textColor = UI.Colours.white
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        subtitleLabel <- [Top(30).to(logoImageView, .bottom), CenterX()]
    }
    
    func setupEmailTextField() {
        view.addSubview(emailTextField)
        let data = TextFieldEntryData(title: "Email address", placeholder: "")
        emailTextField.configure(data)
        emailTextField.tintColor = UI.Colours.white

        emailTextField <- [
            Top(200),
            Height(60),
            Left(30),
            Right(30)
        ]
        
        
        
        
    }
    
    func setupPasswordTextField() {
        view.addSubview(passwordTextField)
        let data = TextFieldEntryData(title: "Email address", placeholder: "user@mail.com")
        emailTextField.configure(data)
        emailTextField.tintColor = UI.Colours.white
        passwordTextField <- [
            Top(25).to(emailTextField),
            Height(60),
            Left(30),
            Right(30)
        ]
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.backgroundColor = UI.Colours.white
        loginButton.setTitleColor(UI.Colours.rosePink, for: .normal)
        loginButton.titleLabel?.font = UI.Font.demiBold(18)
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.cornerRadius = 25
        loginButton.addTarget(self, action: #selector(loginPressed(_:)), for: .touchUpInside)
        loginButton <- [
            Top(40).to(passwordTextField),
            Left(30),
            Right(30),
            Height(50)
        ]
    }
    
    
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        let signUpString = NSMutableAttributedString(string: "Don't have an account? SIGN UP")
        signUpString.addAttributes([NSAttributedStringKey.foregroundColor: UI.Colours.lightGrey, NSAttributedStringKey.font: UI.Font.regular(15)], range: NSMakeRange(0, signUpString.length - 7))
        signUpString.addAttributes([NSAttributedStringKey.foregroundColor: UI.Colours.white, NSAttributedStringKey.font: UI.Font.demiBold(15)], range: NSMakeRange(signUpString.length - 7, 7))
        signUpButton.setAttributedTitle(signUpString, for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpPressed(_:)), for: .touchUpInside)
        signUpButton <- [
            Bottom(30),
            CenterX()
        ]
    }

    @objc func loginPressed(_ sender: Any) {
      
        let tabBar = storyboard?.instantiateViewController(withIdentifier: "TestloginfViewController")
       
        if emailTextField.textField.text != "" && passwordTextField.textField.text != "" {
            AuthService.instance.loginUser(withEmail: emailTextField.textField.text!, andPassword: passwordTextField.textField.text!, loginComplete: { (success, loginError) in
                if success {
                    print("Login Sucessfull")
                    
                    //self.presentDetail(tabBar!)
                    //UIApplication.shared.statusBarStyle = .lightContent
                    
                    self.showMessageResetApp()
                
                  //  self.navigationController?.pushViewController(tabBar!, animated: true)
                  
                    //self.performSegue(withIdentifier: "MainTabBar", sender: nil)
                    // self.present(tabBar!, animated: true, completion: nil)
                   // let vc = ViewController()
                   // self.present(vc, animated: true, completion: nil)
                    
                    
                } else {
                    if let error = loginError?.localizedDescription {
                        print(error)
                       
                    }
                }
            })
        }
    }
    
    
    
    
    func restartApplication () {
        let viewController = HomeVC()
        let navCtrl = UINavigationController(rootViewController: viewController)
        
        guard
            let window = UIApplication.shared.keyWindow,
            let rootViewController = window.rootViewController
            else {
                return
        }
        
        navCtrl.view.frame = rootViewController.view.frame
        navCtrl.view.layoutIfNeeded()
        
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController = navCtrl
        })
        
    }
    
    
    func showMessageResetApp(){
        let exitAppAlert = UIAlertController(title: "LogIn",
                                             message: "Login Successfully",
                                             preferredStyle: .alert)
        
        let resetApp = UIAlertAction(title: "Exit", style: .destructive) {
            (alert) -> Void in
            // home button pressed programmatically - to thorw app to background
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            // terminaing app in background
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                exit(EXIT_SUCCESS)
            })
        }
        
        let laterAction = UIAlertAction(title: "Done", style: .cancel) {
            (alert) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        
        exitAppAlert.addAction(resetApp)
        exitAppAlert.addAction(laterAction)
        present(exitAppAlert, animated: true, completion: nil)
        
    }
    
    @objc func signUpPressed(_ sender: Any) {
        let signUpVC = SignupVC()
        presentDetail(signUpVC)
    }
}

extension AuthVC: UITextFieldDelegate {

}
