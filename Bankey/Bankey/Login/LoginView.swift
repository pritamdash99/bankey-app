//
//  LoginView.swift
//  Bankey
//
//  Created by Pritam Dash on 16/09/22.
//

import Foundation
import UIKit

class LoginView : UIView {
    
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
    }
    
    func layout() {
        
    }
}
