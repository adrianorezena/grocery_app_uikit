//
//  RecentShopTableViewCell.swift
//  Grocery App
//
//  Created by Adriano Rezena on 25/08/21.
//

import UIKit

class RecentShopTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    //MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }


    //MARK: - Setup
    private func setup() {
        containerView.layer.cornerRadius = 20
        
        productImageView.image = UIImage(named: "imgOrange")
        nameLabel.font = UIFont.custom(.bold).withAutoSize(14)
        categoryLabel.font = UIFont.custom(.bold).withAutoSize(12)
        categoryLabel.textColor = .mainLabelSec
        priceLabel.font = UIFont.custom(.extraBold).withAutoSize(16)
        priceLabel.textColor = .mainLabelDest
    }

}


extension UITableView {
    
    func dequeueRecentShopCell(_ indexPath: IndexPath) -> RecentShopTableViewCell? {
        let cell = dequeueReusableCell(withIdentifier: "RecentShopTableViewCell", for: indexPath) as? RecentShopTableViewCell
        return cell
    }
    
}
