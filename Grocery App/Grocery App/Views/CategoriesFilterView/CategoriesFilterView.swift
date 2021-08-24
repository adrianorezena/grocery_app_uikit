//
//  CategoriesFilterView.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit

class CategoriesFilterView: UIView {

    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    

    //MARK: - Private Properties
    var categories: [String] = [
        "All",
        "Fruit",
        "Vegetable",
        "Meat",
        "Dairy",
        "Grain"
    ]


    //MARK: - Initialization
    class func createModule() -> CategoriesFilterView {
        let view: CategoriesFilterView = .fromNib()
        return view
    }
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(CategoryCollectionViewCell.self)
        collectionView.dataSource = self
        //collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
    
}


//MARK: - UICollectionViewDataSource
extension CategoriesFilterView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueCategoryCell(indexPath) else {
            fatalError("Cell not registered")
        }
        
        let category = categories[indexPath.item]
        cell.configure(name: category)
        return cell
    }
    
}
