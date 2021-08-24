//
//  BaseViewController.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit

class BaseViewController: UIViewController {

    private var isFirstViewDidAppear: Bool = true
    private var isFirstViewWillAppear: Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if isFirstViewWillAppear {
            firstViewWillAppear()
            isFirstViewWillAppear = false
        }
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if isFirstViewDidAppear {
            firstViewDidAppear()
            isFirstViewDidAppear = false
        }
    }


    func firstViewWillAppear() {}
    func firstViewDidAppear() {}    
    
}
