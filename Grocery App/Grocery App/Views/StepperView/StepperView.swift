//
//  StepperView.swift
//  Grocery App
//
//  Created by Adriano Rezena on 21/08/21.
//

import UIKit

class StepperView: UIView {

    //MARK: - IBOutlets
    @IBOutlet private weak var minusButton: CustomButton!
    @IBOutlet private weak var plusButton: CustomButton!
    @IBOutlet private weak var valueLabel: UILabel!
    
        
    //MARK: - Public Properties
    var value: Int = 1 {
        didSet {
            valueLabel.text = String(value)
        }
    }


    //MARK: - Initialization
    class func createModule() -> StepperView {
        let view: StepperView = fromNib()
        return view
    }
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    
    //MARK: - Setup
    private func setup() {
        minusButton.roundedCorner = true
        minusButton.backgroundColor = .mainGreenTer
        minusButton.setTitleColor(.mainLabelDest, for: .normal)
        minusButton.titleLabel?.font = UIFont.custom(.extraBold).withSize(22)
        
        plusButton.roundedCorner = true
        plusButton.backgroundColor = .mainLabelDest
        plusButton.setTitleColor(.white, for: .normal)
        plusButton.titleLabel?.font = UIFont.custom(.medium).withSize(22)
        
        plusButton.setGradientColor([.mainButtonGradientLight, .mainButtonGradientDark], for: .normal)
        plusButton.setGradientLocations([0.5, 1])
        
        valueLabel.font = UIFont.custom(.extraBold).withSize(20)
    }
    
    
    //MARK: - Actions
    
    @IBAction func onMinusButton(_ sender: Any) {
        guard value > 1 else { return }
        value -= 1
    }
    
    
    @IBAction func onPlusButton(_ sender: Any) {
        guard value < Int.max else { return }
        value += 1
    }
    
}
