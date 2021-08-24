//
//  CategoryCollectionViewCell.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {

    
    //MARK: - IBOutlets
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var selectionView: UIView!
    

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    override var isSelected: Bool {
        didSet {
            setupCategoryLabel(selected: isSelected)
        }
    }

    
    //MARK: - Setup
    private func setup() {
        setupCategoryLabel(selected: false)
        
        selectionView.alpha = 0
        selectionView.backgroundColor = .mainLabelDest
        selectionView.layer.cornerRadius = selectionView.bounds.width / 2
    }
    
    
    private func setupCategoryLabel(selected: Bool) {
        if selected {
            categoryLabel.font = UIFont.custom(.bold).withSize(16)
            categoryLabel.textColor = .mainLabelDest
            selectionView.alpha = 1
        } else {
            categoryLabel.font = UIFont.custom(.bold).withSize(16)
            categoryLabel.textColor = .mainLabelSec
            selectionView.alpha = 0
        }
        
    }
    

    //MARK: - Configuration
    func configure(name: String) {
        categoryLabel.text = name
    }

}


//MARK: - UICollectionView
extension UICollectionView {
    func dequeueCategoryCell(_ indexPath: IndexPath) -> CategoryCollectionViewCell? {
        let cell = dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell
        return cell
    }
}
