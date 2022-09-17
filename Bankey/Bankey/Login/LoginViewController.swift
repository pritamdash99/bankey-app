//
//  ViewController.swift
//  Bankey
//
//  Created by Pritam Dash on 16/09/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //Number 1 thing you have to remember when working with custom views and auto layout is to set the translateAutoresizingMaskIntoConstraints = false
    // translateAutoresizingMaskIntoConstraints takes any element or control of a view in your view controller and makes it ready for auto layout.
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username : String? {
        return loginView.userNameTextField.text
    }
    
    var password : String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    private func style()
    {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for activityIndicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = "Sign in failure"
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        //Do some autolayout constraints
        
        //This sets isActive to true for all constraints contained within
        
        //LoginView
        NSLayoutConstraint.activate([
            //for mid of the page :
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //for leading and trailing we use the SystemSpacingAfter multiplier and put spacing of leading here, 1 = 8 points
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        //SignIn Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //ErrorMessage Label

        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 1),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
    
}

extension LoginViewController {
    @objc func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("username or password shouldnever be blank")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage : "username / password cannot be blank")
            return
        }
        
        if username == "Pritam" && password == "Welcome"{
            signInButton.configuration?.showsActivityIndicator = true
        }else{
            configureView(withMessage: "Incorrect username or password")
        }
    }
    
    //withMessage : argument label
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}

