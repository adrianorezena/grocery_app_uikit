//
//  RecentShopView.swift
//  Grocery App
//
//  Created by Adriano Rezena on 25/08/21.
//

import UIKit

class RecentShopView: UIView {

    
    //MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: AutoSizeTableView!
    
    
    //MARK: - Initialization
    class func createModule() -> RecentShopView {
        let view: RecentShopView = fromNib()
        return view
    }
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    
    //MARK: - Setup
    private func setup() {
        titleLabel.font = UIFont.custom(.extraBold).withSize(22)
        
        setupTableView()
    }
    
    
    private func setupTableView() {
        endEditing(true)
        tableView.backgroundColor = .clear
        tableView.register(RecentShopTableViewCell.self)
        tableView.dataSource = self
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.tableFooterView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: 1)))
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
    }
    
}


//MARK: - UITableViewDataSource
extension RecentShopView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueRecentShopCell(indexPath) else {
            fatalError("Cell not registered")
        }
        
        return cell
    }
    
}
