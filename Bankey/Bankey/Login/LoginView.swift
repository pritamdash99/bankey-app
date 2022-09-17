//
//  LoginView.swift
//  Bankey
//
//  Created by Pritam Dash on 16/09/22.
//

import Foundation
import UIKit

class LoginView : UIView {
    let userNameTextField = UITextField()
    
    override init(frame : CGRect){
        super.init(frame : frame)
            style()
            layout()
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width : 200, height : 200)
    }
    //This  helps with brand new view to size itself and if it is ever put into a stack view this view will know roughly how to size itself.
}

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "UserName"
        userNameTextField.delegate = self
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            userNameTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: userNameTextField.trailingAnchor, multiplier: 1)
        ])
    }
    
}

extension LoginView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
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
