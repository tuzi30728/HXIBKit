//
//  HXIBLayoutButton.swift
//  HXIBKit
//
//  Created by HongXiangWen on 2018/5/25.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

class HXIBLayoutButton: HXIBButton {

    enum HXIBButtonLayoutType: String {
        case left // 默认 图标在左边
        case top  // 图标在上
        case right // 图标在右
        case bottom // 图标在下
    }

    @IBInspectable var layoutType: String = "left" {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var imageTitleOffset: CGFloat = 5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let layoutType = HXIBButtonLayoutType(rawValue: layoutType) else { return }
        guard let titleLabel = titleLabel, let imageView = imageView else { return }
        let titleSize = titleLabel.frame.size
        let imageSize = imageView.frame.size
        switch layoutType {
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -imageTitleOffset / 2, bottom: 0, right: imageTitleOffset / 2)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleOffset / 2, bottom: 0, right: -imageTitleOffset / 2)
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + imageTitleOffset), left: 0, bottom: 0, right: -titleSize.width)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + imageTitleOffset), right: 0)
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: titleSize.width + imageTitleOffset / 2, bottom: 0, right: -(titleSize.width + imageTitleOffset / 2))
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageSize.width + imageTitleOffset / 2), bottom: 0, right: imageSize.width + imageTitleOffset / 2)
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top:0, left: 0, bottom: -(titleSize.height + imageTitleOffset), right: -titleSize.width)
            titleEdgeInsets = UIEdgeInsets(top: -(imageSize.height + imageTitleOffset), left: -imageSize.width, bottom: 0, right: 0)
        }
    }
    
    
}
