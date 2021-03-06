//
//  ProductViewController.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit

class ProductViewController: BaseViewController {
    
    
    //MARK: - IBOutlets
    @IBOutlet private weak var topSafeAreaView: UIView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var productBackgroundView: UIView!
    @IBOutlet private weak var productLabel: UILabel!
    @IBOutlet private weak var descriptionTitleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var priceTitleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var rateStepperStackView: UIStackView!
    @IBOutlet private weak var addToCartButton: CustomButton!
    @IBOutlet private weak var backButton: NavButton!
    @IBOutlet private weak var cartButton: NavButton!
    
    
    //MARK: - Private
    var product: Product!
    

    //MARK: - Initialization
    class func createModule(product: Product) -> ProductViewController {
        let controller = ProductViewController()
        controller.product = product
        return controller
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    
    override func firstViewWillAppear() {
        super.firstViewWillAppear()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        DispatchQueue.main.async {
            self.productBackgroundView.addBottomCurve(2.5)
        }
        
    }
    
    
    //MARK: - Setup
    private func setup() {
        productLabel.font = UIFont.custom(.extraBold).withSize(28)
        descriptionTitleLabel.font = UIFont.custom(.extraBold).withSize(22)
        descriptionLabel.font = UIFont.custom(.medium).withSize(14)
        descriptionLabel.textColor = .mainLabelSec
        
        priceTitleLabel.font = UIFont.custom(.bold).withSize(14)
        priceTitleLabel.textColor = .mainLabelSec
        priceLabel.font = UIFont.custom(.bold).withSize(28)
        
        let stepperView = StepperView.createModule()
        rateStepperStackView.addArrangedSubview(stepperView)
        
        addToCartButton.cornerRadius = 10
        addToCartButton.setGradientColor([.mainButtonGradientLight, .mainButtonGradientDark], for: .normal)
        addToCartButton.setGradientStartPoint(CGPoint(x: 0.0, y: 0))
        addToCartButton.setGradientEndPoint(CGPoint(x: 1.0, y: 0.5))
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.titleLabel?.font = UIFont.custom(.medium).withSize(18)
        
        productLabel.text = product.name
        priceLabel.text = "$\(product.price)"
        descriptionLabel.text = product.description
        
        if let image = product.image {
            productImageView.image = UIImage(named: image)
        }
        
        if let color = product.color {
            let uiColor = UIColor(hex: color).withAlphaComponent(0.2)
            productBackgroundView.backgroundColor = uiColor
            topSafeAreaView.backgroundColor = uiColor
        }
        
    }
    
    
    //MARK: - Actions
    @IBAction func onBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func onCartButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
