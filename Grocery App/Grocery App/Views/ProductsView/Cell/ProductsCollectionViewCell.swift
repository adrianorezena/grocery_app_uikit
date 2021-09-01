//
//  ProductsCollectionViewCell.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {

    //MARK: - IBOutlets
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var roundedView: UIView!
    

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutIfNeeded()
        roundedView.addBottomCurve(2.5)
    }
    
    //MARK: - Setup
    private func setup() {
        nameLabel.font = UIFont.custom(.extraBold).withSize(20)
        nameLabel.textColor = .mainLabel
        
        categoryLabel.font = UIFont.custom(.bold).withSize(15)
        categoryLabel.textColor = .mainLabelSec
        
        priceLabel.font = UIFont.custom(.bold).withSize(22)
        priceLabel.textColor = .mainLabelDest
    }
    
    
    //MARK: - Configure
    func configure(name: String, category: String, price: Double, image: String?, color: String?) {
        
        nameLabel.text = name
        categoryLabel.text = category
        priceLabel.text = "$\(price)"
        
        if let image = image {
            productImageView.image = UIImage(named: image)
        } else {
            productImageView.image = nil
        }
        
        if let color = color {
            let uiColor = UIColor(hex: color)
            roundedView.backgroundColor = uiColor.withAlphaComponent(0.2)
        }
        
    }
    
}


extension UICollectionView {
    func dequeueProductsCell(_ indexPath: IndexPath) -> ProductsCollectionViewCell? {
        let cell = dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as? ProductsCollectionViewCell
        return cell
    }
}
