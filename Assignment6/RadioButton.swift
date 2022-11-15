//
//  RadioButton.swift
//  Assignment6
//
//  Created by Thet Hlaing Phyo on 11/14/22.
//

import UIKit

class RadioButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initButton()
    }
    
    func initButton() {
        self.backgroundColor = .clear
        self.tintColor = .clear
        self.setTitle("", for: .normal)
        self.setImage(UIImage(named: "radio_button_unchecked")?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.setImage(UIImage(named: "radio_button_checked")?.withRenderingMode(.alwaysOriginal), for: .highlighted)
        self.setImage(UIImage(named: "radio_button_checked")?.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
