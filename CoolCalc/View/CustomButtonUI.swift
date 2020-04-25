//
//  CustomButtonUI.swift
//  CoolCalc
//
//  Created by Kelly O'Brien on 4/19/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButtonUI: UIButton {

    override func prepareForInterfaceBuilder() {
        createCustomButton()
    }
    override func awakeFromNib() {
        createCustomButton()
    }
    
    private func createCustomButton() {
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        layer.cornerRadius = 7.0
        clipsToBounds = true
    }
}
