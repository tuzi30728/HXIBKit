//
//  HXIBLabel.swift
//  HXIBKit
//
//  Created by HongXiangWen on 2018/5/25.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

@IBDesignable
class HXIBLabel: UILabel {

    @IBInspectable var textInsetTop: CGFloat {
        get {
            return textInsets.top
        }
        set {
            textInsets.top = newValue
        }
    }
    
    @IBInspectable var textInsetLeft: CGFloat {
        get {
            return textInsets.left
        }
        set {
            textInsets.left = newValue
        }
    }
    
    @IBInspectable var textInsetBottom: CGFloat {
        get {
            return textInsets.bottom
        }
        set {
            textInsets.bottom = newValue
        }
    }
    
    @IBInspectable var textInsetRight: CGFloat {
        get {
            return textInsets.right
        }
        set {
            textInsets.right = newValue
        }
    }
    
    // 当没有文字时是否忽略textInset
    @IBInspectable var ignoreInsetsWhenTextEmpty: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var textInsets: UIEdgeInsets = UIEdgeInsets.zero {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, textInsets)
        super.drawText(in: newRect)
    }
    
    // UILabel的内容区域
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insets = textInsets
        var rect = super.textRect(forBounds: UIEdgeInsetsInsetRect(bounds, insets), limitedToNumberOfLines: numberOfLines)
        if text?.count == 0 && ignoreInsetsWhenTextEmpty {
            return rect
        }
        rect.origin.x -= insets.left
        rect.origin.y -= insets.top
        rect.size.width += (insets.left + insets.right)
        rect.size.height += (insets.top + insets.bottom)
        return rect
    }


}
