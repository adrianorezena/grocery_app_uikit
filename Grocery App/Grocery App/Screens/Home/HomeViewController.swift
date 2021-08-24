//
//  HomeViewController.swift
//  Grocery App
//
//  Created by Adriano Rezena on 20/08/21.
//

import UIKit

class HomeViewController: BaseViewController {

    
    //MARK: - IBOutlets
    @IBOutlet private weak var headerTitleLabel: UILabel!
    @IBOutlet private weak var headerNameLabel: UILabel!
    @IBOutlet private weak var headerProfileImageView: UIImageView!
    
    @IBOutlet private weak var searchBar: UISearchBar!
    
    @IBOutlet private weak var mainVStackView: UIStackView!
    
    
    //MARK: - Components
    //MARK: - Private Properties
    //MARK: - Public Properties
    //MARK: - Constructors
    //MARK: - Initialization
    class func createModule() -> HomeViewController {
        let controller = HomeViewController()
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
        
        let vc = GetStartedViewController()
        present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    //MARK: - Setup
    private func setup() {
        setupHeader()
        setupSearch()
        setupCategories()
        setupProducts()
    }
    
    
    private func setupHeader() {
        headerTitleLabel.font = UIFont.custom(.bold).withSize(16)
        headerTitleLabel.textColor = UIColor.mainLabelSec
        
        headerNameLabel.font = UIFont.custom(.bold).withSize(28)
        headerNameLabel.textColor = UIColor.mainLabel
        
        headerProfileImageView.layer.cornerRadius = 8
    }
    
    
    private func setupSearch() {
        //searchBar.delegate = self
        searchBar.setFieldColor(UIColor.mainBackground)
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }
    
    
    private func setupCategories() {
        let categoriesView = CategoriesFilterView.createModule()
        mainVStackView.addArrangedSubview(categoriesView)
        categoriesView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    private func setupProducts() {
        let productsView = ProductsView.createModule(delegate: self)
        mainVStackView.addArrangedSubview(productsView)
        productsView.heightAnchor.constraint(equalToConstant: 275).isActive = true
        
        let blankView = UIView()
        mainVStackView.addArrangedSubview(blankView)
    }
    
    //MARK: - Actions
    //MARK: - Configuration
    //MARK: - Delegate


}


extension HomeViewController: ProductsViewDelegate {
    
    func didSelectedProduct(product: Product) {
        let vc = ProductViewController.createModule()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
