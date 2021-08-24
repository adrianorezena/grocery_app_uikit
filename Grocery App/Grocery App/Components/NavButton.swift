//
//  NavButton.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit

class NavButton: CustomButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.commomInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.commomInit()
    }

    private func commomInit() {
        backgroundColor = .mainBackground
        cornerRadius = 10
        tintColor = .mainButtonAssetNav
    }
    
}
