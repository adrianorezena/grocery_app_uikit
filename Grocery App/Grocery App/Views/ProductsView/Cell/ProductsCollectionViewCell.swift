//
//  ProductsCollectionViewCell.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {

    //MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    
    //MARK: - Setup
    private func setup() {
        nameLabel.font = UIFont.custom(.extraBold).withSize(20)
        nameLabel.textColor = .mainLabel
        
        categoryLabel.font = UIFont.custom(.bold).withSize(16)
        categoryLabel.textColor = .mainLabelSec
        
        priceLabel.font = UIFont.custom(.bold).withSize(22)
        priceLabel.textColor = .mainLabelDest
    }
    
}


extension UICollectionView {
    func dequeueProductsCell(_ indexPath: IndexPath) -> ProductsCollectionViewCell? {
        let cell = dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as? ProductsCollectionViewCell
        return cell
    }
}
