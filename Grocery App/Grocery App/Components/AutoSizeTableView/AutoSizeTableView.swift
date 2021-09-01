//
//  AutoSizeTableView.swift
//  Grocery App
//
//  Created by Adriano Rezena on 31/08/21.
//

import UIKit


class AutoSizeTableView: UITableView {
    
    var maxHeight: CGFloat?
    
    
    override func reloadData() {
        super.reloadData()
        
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }
    
    
    override var intrinsicContentSize: CGSize {
        let height = maxHeight ?? contentSize.height
        return CGSize(width: contentSize.width, height: height)
    }
    
}
