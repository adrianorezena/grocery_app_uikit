//
//  CustomButton.swift
//  Grocery App
//
//  Created by Adriano Rezena on 20/08/21.
//

import UIKit


@IBDesignable
class CustomButton: BaseButton {
    
    let gradientLayer = CAGradientLayer()
    private var gradientColorDict: [String : [UIColor]] = [:]
    private var gradientLocations: [NSNumber]? = nil
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.commomInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.commomInit()
    }

    private func commomInit() {
        self.titleLabel?.lineBreakMode = .byClipping

        layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.locations = gradientLocations
    }

    deinit {
        gradientLayer.removeAllAnimations()
    }
    
    
    
    //MARK: - Corner
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable
    var roundedCorner: Bool = false {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    // MARK: -
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    
    
    // MARK: - Setup
    private func setup() {
        if roundedCorner {
            layer.cornerRadius = self.frame.height / 2
            cornerRadius = self.frame.height / 2
        } else {
            layer.cornerRadius = cornerRadius
        }
        
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        gradientLayer.masksToBounds = cornerRadius > 0
    }
    
    
    
    // MARK: - Gradient
    func setGradientColor(_ colors: [UIColor]?, for state: UIControl.State) {
        let key = gradientColorKey(for: state)
        gradientColorDict[key] = colors
        setupGradient()
        setNeedsDisplay()
    }
    
    
    func gradientColor(for state: UIControl.State) -> [UIColor]? {
        let key = gradientColorKey(for: state)
        return gradientColorDict[key]
    }
    
    func setGradientStartPoint(_ point: CGPoint) {
        gradientLayer.startPoint = point
        setupGradient()
    }

    func setGradientEndPoint(_ point: CGPoint) {
        gradientLayer.endPoint = point
        setupGradient()
    }

    func setGradientLocations(_ locations: [NSNumber]?) {
        gradientLocations = locations
        setNeedsDisplay()
        setupGradient()
    }
    
    private func gradientColorKey(for state: UIControl.State) -> String {
        return "gr\(state.rawValue)"
    }
    
    
    func setupGradient() {
        let currentState = state

        if let gradientColors = gradientColor(for: currentState) {
            var colors: [CGColor] = []
            for color in gradientColors {
                colors.append(color.cgColor)
            }

            gradientLayer.cornerRadius = cornerRadius
            gradientLayer.masksToBounds = cornerRadius > 0
            gradientLayer.locations = gradientLocations
            gradientLayer.colors = colors
            gradientLayer.isHidden = false
        }
        else {
            gradientLayer.isHidden = true
            gradientLayer.colors = nil
        }

    }
    
}
