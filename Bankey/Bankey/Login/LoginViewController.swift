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
    }
    
    private func layout() {
        view.addSubview(loginView)
        //Do some autolayout constraints
        
        //This sets isActive to true for all constraints contained within
        NSLayoutConstraint.activate([
            //for mid of the page :
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //for leading and trailing we use the SystemSpacingAfter multiplier and put spacing of leading here, 1 = 8 points
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            
        ])
    }
}

