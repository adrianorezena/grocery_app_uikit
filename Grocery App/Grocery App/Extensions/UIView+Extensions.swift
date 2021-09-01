//
//  UIView+Extensions.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit


extension UIView {
    
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    
    func allSubviewsOf<T: UIView>(type: T.Type) -> [T] {
        var all = [T]()

        func getSubview(view: UIView) {
            if let aView = view as? T {
                all.append(aView)
            }

            guard view.subviews.count > 0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }

        getSubview(view: self)
        return all
    }
    
    
    
    func addTopCurve(_ value: CGFloat) {
        guard value != 0 else { return }
        
        let offset: CGFloat =  frame.width / value
        let bounds: CGRect = bounds
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x:bounds.origin.x - offset / 2,y: bounds.origin.y, width : bounds.size.width + offset, height :bounds.size.height)

        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer][1]][1]
        layer.mask = maskLayer
    }
    
    
    
    func addBottomCurve(_ value: CGFloat) {
        guard value != 0 else { return }

        let offset: CGFloat = frame.width / value
        let bounds: CGRect = bounds

        //Bottom side curve
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)

        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)

        //Bottom side curve
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)

        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer
        layer.mask = maskLayer
    }
    
    
    func updateHeight(_ constant: CGFloat) {
        if let heightConstraints = constraints.filter({ $0.firstAttribute == .height && $0.isActive }).first {
            heightConstraints.constant = constant
        }
    }
    
    
    func updateHeight(_ constants: [ScreenType: CGFloat]) {
        guard let newConstant = constants[UIDevice.screenType] else { return }
        
        if let heightConstraints = constraints.filter({ $0.firstAttribute == .height && $0.isActive }).first {
            heightConstraints.constant = newConstant
        }
    }
    
    enum Anchor {
        case top(to: NSLayoutYAxisAnchor, constant: CGFloat? = nil)
        case leading(to: NSLayoutXAxisAnchor, constant: CGFloat? = nil)
        case trailing(to: NSLayoutXAxisAnchor, constant: CGFloat? = nil)
        case bottom(to: NSLayoutYAxisAnchor, constant: CGFloat? = nil)
        case centerY(to: NSLayoutYAxisAnchor, constant: CGFloat? = nil)
        case centerX(to: NSLayoutXAxisAnchor, constant: CGFloat? = nil)
        case height(to: NSLayoutDimension, constant: CGFloat? = nil)
        case heightConstant(_ constant: CGFloat)
        case width(to: NSLayoutDimension, constant: CGFloat? = nil)
        case widthConstant(_ constant: CGFloat)
    }

    
    func setAnchors(_ anchors: [Anchor]) {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        for anchor in anchors {
            switch anchor {
            case .top(let equalTo, let constant):
                topAnchor.constraint(equalTo: equalTo, constant: constant ?? 0).isActive = true
            
            case .bottom(let equalTo, let constant):
                bottomAnchor.constraint(equalTo: equalTo, constant: constant ?? 0).isActive = true
                
            case .leading(let equalTo, let constant):
                leadingAnchor.constraint(equalTo: equalTo, constant: constant ?? 0).isActive = true
                
            case .trailing(let equalTo, let constant):
                trailingAnchor.constraint(equalTo: equalTo, constant: constant ?? 0).isActive = true
                
            case .centerX(let equalTo, let constant):
                centerXAnchor.constraint(equalTo: equalTo, constant: constant ?? 0).isActive = true
            
            case .centerY(let equalTo, let constant):
                centerYAnchor.constraint(equalTo: equalTo, constant: constant ?? 0).isActive = true
                
            case .heightConstant(let constant):
                heightAnchor.constraint(equalToConstant: constant).isActive = true
                
            case .height(let equalTo, let constant):
                heightAnchor.constraint(equalTo: equalTo, constant: constant ?? 0).isActive = true

            case .widthConstant(let constant):
                widthAnchor.constraint(equalToConstant: constant).isActive = true

            case .width(let equalTo, let constant):
                widthAnchor.constraint(equalTo: equalTo, constant: constant ?? 0).isActive = true
                
            }
        }
    }
    
    
}






struct ClassWrapper<T> {
    public let base: T
    public init(_ base: T) {
        self.base = base
    }
}


public protocol ConstrainableCompatible: AnyObject { }


extension ConstrainableCompatible {
    /// Gets a namespace holder for Kingfisher compatible types.
    var acr: ClassWrapper<Self> {
        get { return ClassWrapper(self) }
        set { }
    }
}


extension UIView: ConstrainableCompatible {}
