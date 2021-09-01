//
//  ProductsView.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit


protocol ProductsViewDataSource: AnyObject {
    func productsView(_ productsView: ProductsView) -> Int
    func productsView(_ productsView: ProductsView, productForItemAt indexPath: IndexPath) -> Product
}


protocol ProductsViewDelegate: AnyObject {
    func didSelectedProduct(product: Product)
}


class ProductsView: UIView {

    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private var dataSource: ProductsViewDataSource?
    private var delegate: ProductsViewDelegate?
    
    
    //MARK: - Initialization
    class func createModule(dataSource: ProductsViewDataSource, delegate: ProductsViewDelegate) -> ProductsView {
        let view: ProductsView = .fromNib()
        view.dataSource = dataSource
        view.delegate = delegate
        return view
    }
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(ProductsCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    
}


//MARK: - UICollectionViewDataSource
extension ProductsView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.productsView(self) ?? 0
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueProductsCell(indexPath) else {
            fatalError("Cell not registered")
        }
        
        let product = dataSource!.productsView(self, productForItemAt: indexPath)
        cell.configure(name: product.name, category: product.category.name, price: product.price, image: product.image, color: product.color)
        
        cell.layer.cornerRadius = 20
        return cell
    }
    
}


//MARK: - UICollectionViewDelegate
extension ProductsView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = dataSource!.productsView(self, productForItemAt: indexPath)
        delegate?.didSelectedProduct(product: product)
    }
    
}
    

//MARK: - UICollectionViewDelegateFlowLayout
extension ProductsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.height * 0.80, height: collectionView.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
