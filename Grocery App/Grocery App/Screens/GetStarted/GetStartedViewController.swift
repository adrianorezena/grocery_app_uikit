//
//  GetStartedViewController.swift
//  Grocery App
//
//  Created by Adriano Rezena on 20/08/21.
//

import UIKit


class GetStartedViewController: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var getStartedButton: MainButton!
    @IBOutlet private weak var bottomWhiteView: UIView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    
    override func firstViewWillAppear() {
        super.firstViewWillAppear()
    
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        DispatchQueue.main.async {
            self.bottomWhiteView.addTopCurve(1.5)
        }
    }
    
    
    
    //MARK: - Setup
    private func setup() {
        overrideUserInterfaceStyle = .light
        
        titleLabel.font = UIFont.custom(.extraBold).withAutoSize(36)
        
        subtitleLabel.font = UIFont.custom(.medium).withAutoSize(18)
        subtitleLabel.textColor = UIColor.mainLabelSec
        
        getStartedButton.roundedCorner = true
        getStartedButton.setTitleColor(.white, for: .normal)
        getStartedButton.titleLabel?.font = UIFont.custom(.bold).withAutoSize(18)
        getStartedButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 60)
        
        getStartedButton.setGradientColor([.mainButtonGradientLight, .mainButtonGradientDark], for: .normal)
        getStartedButton.setGradientStartPoint(CGPoint(x: 0.0, y: 0))
        getStartedButton.setGradientEndPoint(CGPoint(x: 1.0, y: 0.5))
        
        getStartedButton.updateHeight(
            [
                .iPhones_5_5s_5c_SE : 60,
                .iPadPro12: 100
            ]
        )
        
    }
    
    
    //MARK: - Actions
    @IBAction func onGetStartedButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
