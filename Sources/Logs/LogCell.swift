//
//  DebugWidget.swift
//  demo
//
//  Created by liman on 26/11/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class LogCell: UITableViewCell {

    @IBOutlet weak var labelContent: UITextView!
    @IBOutlet weak var viewTypeLogColor: UIView!
    
    var model: LogModel? {
        didSet {
            guard let model = model else { return }
            
            labelContent.text = nil
            let format = LoggerFormat.format(model)
            labelContent.text = format.str
            labelContent.attributedText = format.attr
            
            //tag
            if model.isTag == true {
                self.contentView.backgroundColor = "#007aff".hexColor
            }else{
                self.contentView.backgroundColor = .black
            }
        }
    }
    
    
    //MARK: - override
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(selectAll(_:)) {
            return true
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    override func selectAll(_ sender: Any?) {
        labelContent.selectAll(sender)
    }
}
