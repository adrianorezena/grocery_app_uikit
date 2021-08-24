//
//  UICollectionView+Extensions.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

public protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String { return String(describing: self) }
}


extension NibLoadableView where Self: UIView {
    static var nibName: String { return String(describing: self) }
}


extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }

    func register<T: UICollectionReusableView>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.defaultReuseIdentifier)
    }
}

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
}
