//
//  ProductsView.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit


protocol ProductsViewDelegate: AnyObject {
    func didSelectedProduct(product: Product)
}


class ProductsView: UIView {

    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private var delegate: ProductsViewDelegate?
    
    
    //MARK: - Initialization
    class func createModule(delegate: ProductsViewDelegate) -> ProductsView {
        let view: ProductsView = .fromNib()
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
        return 10
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueProductsCell(indexPath) else {
            fatalError("Cell not registered")
        }
        
        cell.layer.cornerRadius = 20
        return cell
    }
    
}


//MARK: - UICollectionViewDelegate
extension ProductsView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = Product(name: "Orange Fruit", category: ProductCategory(id: 1, name: "Fruit"), price: 14.99, rate: 4.4, description: "Description")
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
