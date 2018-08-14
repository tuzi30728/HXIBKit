//
//  HXIBTextView.swift
//  HXIBKit
//
//  Created by HongXiangWen on 2018/5/25.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

private let kTextInsetTop: CGFloat = 8
private let kTextInsetLeft: CGFloat = 5
private let kDefaultPlaceholderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)

@IBDesignable
class HXIBTextView: UITextView {

    @IBInspectable var placeholder: String? {
        didSet {
            placeLabel.text = placeholder
            placeLabel.sizeToFit()
            setNeedsLayout()
        }
    }
    
    @IBInspectable var placeholderColor: UIColor = kDefaultPlaceholderColor {
        didSet {
            placeLabel.textColor = placeholderColor
        }
    }
    
    override var font: UIFont? {
        didSet {
            placeLabel.font = font
        }
    }
    
    override var text: String! {
        didSet {
            textDidChange()
        }
    }
    
    private lazy var placeLabel: UILabel = {
        let placeLabel = UILabel()
        placeLabel.frame = CGRect(x: kTextInsetLeft, y: kTextInsetTop, width: 0, height: 0)
        placeLabel.textColor = placeholderColor
        return placeLabel
    }()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        if newWindow != nil {
            /// 监听文字改变
            NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: .UITextViewTextDidChange, object: nil)
        } else {
            /// 移除监听
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        /// 先调用一次确保正确
        textDidChange()
    }
    
    private func setupUI() {
        /// 设置默认字体
        font = UIFont.systemFont(ofSize: 14)
        /// 添加placeLabel
        addSubview(placeLabel)
    }
    
    @objc private func textDidChange() {
        if text.count == 0 {
            placeLabel.text = placeholder
        } else {
            placeLabel.text = ""
        }
    }
    
}
