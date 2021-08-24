//
//  BaseButton.swift
//  Grocery App
//
//  Created by Adriano Rezena on 20/08/21.
//

import UIKit

class BaseButton: UIButton {
    
    
    //MARK: - Constructors
    override init(frame: CGRect) {
        super.init(frame: frame)

        commomInit()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commomInit()
    }

    
    private func commomInit() {
        addTarget(self, action: #selector(onButtonTouch), for: .touchDown)
        addTarget(self, action: #selector(onButtonRelease), for: .touchUpOutside)
        addTarget(self, action: #selector(onButtonTouchUpInside), for: .touchUpInside)
    }
    
    
    //MARK: - Private
    @objc private func onButtonTouch() {
        let basicAnimation = CABasicAnimation(keyPath: "transform.scale")
        basicAnimation.duration = 0.2
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.fromValue = 1.0
        basicAnimation.toValue = 0.95
        self.layer.add(basicAnimation, forKey: "layerScale")
    }

    @objc private func onButtonRelease() {
        let basicAnimation = CABasicAnimation(keyPath: "transform.scale")
        basicAnimation.duration = 0.2
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.fromValue = 0.95
        basicAnimation.toValue = 1.0
        self.layer.add(basicAnimation, forKey: "layerScale")
    }
    
    @objc func onButtonTouchUpInside() {
        onButtonRelease()
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }

}

