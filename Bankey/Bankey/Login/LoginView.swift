//
//  LoginView.swift
//  Bankey
//
//  Created by Pritam Dash on 16/09/22.
//

import Foundation
import UIKit

class LoginView : UIView {
    
    let stackView = UIStackView()
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame : CGRect){
        super.init(frame : frame)
            style()
            layout()
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width : 200, height : 200)
//    }
    //This  helps with brand new view to size itself and if it is ever put into a stack view this view will know roughly how to size itself.
    //intrinsic size is the default size of a element that wants to size itself in autolayout like buttons, labels, etc all of them have intrinsic size.
    //we had override it earlier to help ourselves if the view did not know to perfectly size itself, now that we are using stack view, we don't need it anymore, so we comment it out.
}

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "UserName"
        userNameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
    }
    
    func layout() {
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        //.activate basically calls isActive for all the above constraints mentioned.
        
        //don't need the trailing and leading for the divider as the autolayout will stretch the view for us, so just need to specify the height.
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
}

extension LoginView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
