//
//  DebugWidget.swift
//  demo
//
//  Created by liman on 26/11/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class NetworkDetailCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var middleLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var editView: UIView!
    
    @IBOutlet weak var titleViewBottomSpaceToMiddleLine: NSLayoutConstraint!
    //-12.5
    
    
//    var tapTitleViewCallback:((NetworkDetailModel?) -> Void)?
    var tapEditViewCallback:((NetworkDetailModel?) -> Void)?
    
    var detailModel: NetworkDetailModel? {
        didSet {
            
            titleLabel.text = detailModel?.title
            contentTextView.text = detailModel?.content
            
            //图片
            if detailModel?.image == nil {
                imgView.isHidden = true
            }else{
                imgView.isHidden = false
                imgView.image = detailModel?.image
            }
            
            //自动隐藏内容
            if detailModel?.blankContent == "..." {
                middleLine.isHidden = true
                imgView.isHidden = true
                titleViewBottomSpaceToMiddleLine.constant = -12.5 + 2
            }else{
                middleLine.isHidden = false
                if detailModel?.image != nil {
                    imgView.isHidden = false
                }
                titleViewBottomSpaceToMiddleLine.constant = 0
            }
            
            //底部分割线
            if detailModel?.isLast == true {
                bottomLine.isHidden = false
            }else{
                bottomLine.isHidden = true
            }
            
            //to JSON
//            if detailModel?.title == "REQUEST HEADER" || detailModel?.title == "RESPONSE HEADER" {
////                editView.isHidden = false
//            }else{
//                if detailModel?.title == "REQUEST" {
//                    if let content = detailModel?.content {
//                        if let _ = content.stringToDictionary() {
//                            //JSON格式
////                            editView.isHidden = true
//                        }else{
//                            //Form格式
////                            editView.isHidden = false
//                        }
//                    }else{
////                        editView.isHidden = true
//                    }
//                }else{
////                    editView.isHidden = true
//                }
//            }
        }
    }
    
    //MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        titleView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapTitleView)))
        editView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapEditView)))
        
        contentTextView.textContainer.lineFragmentPadding = 0
        contentTextView.textContainerInset = .zero
    }
    
    //MARK: - target action
    //自动隐藏内容
//    @objc func tapTitleView() {
//        if let tapTitleViewCallback = tapTitleViewCallback {
//            tapTitleViewCallback(detailModel)
//        }
//    }
    
    //编辑
    @objc func tapEditView() {
        if let tapEditViewCallback = tapEditViewCallback {
            tapEditViewCallback(detailModel)
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
        contentTextView.selectAll(sender)
    }
}
