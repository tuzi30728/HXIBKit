//
//  HXIBLoadingButton.swift
//  HXIBKit
//
//  Created by HongXiangWen on 2018/5/25.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

private let kActivityViewWH: CGFloat = 20

class HXIBLoadingButton: HXIBButton {

    enum HXIBButtonActivityPosition: String {
        case center
        case left
        case right
    }
    
    enum HXIBButtonActivityStyle: String {
        case white
        case gray
    }
    
    /// avtivity
    @IBInspectable var activityPosition: String = "center" {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var activityStyle: String = "white" {
        didSet {
            guard let style = HXIBButtonActivityStyle(rawValue: activityStyle) else { return }
            switch style {
            case .white:
                activityView.activityIndicatorViewStyle = .white
            case .gray:
                activityView.activityIndicatorViewStyle = .gray
            }
        }
    }
    
    @IBInspectable var activityHidesWhenStopped: Bool = true {
        didSet {
            activityView.hidesWhenStopped = activityHidesWhenStopped
        }
    }
    
    @IBInspectable var activityOffset: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    private lazy var activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityView.hidesWhenStopped = activityHidesWhenStopped
        return activityView
    }()
    
    private var tempTitle: String?
    private weak var loadingView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(activityView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(activityView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let position = HXIBButtonActivityPosition(rawValue: activityPosition) else { return }
        switch position {
        case .center:
            activityView.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        case .left:
            activityView.center = CGPoint(x: (titleLabel?.frame.minX ?? kActivityViewWH) - kActivityViewWH / 2 - activityOffset, y: bounds.height / 2)
        case .right:
            activityView.center = CGPoint(x: (titleLabel?.frame.maxX ?? (bounds.width - kActivityViewWH)) + kActivityViewWH / 2 + activityOffset, y: bounds.height / 2)
        }
    }

}

// MARK: -  Public Methods
extension HXIBLoadingButton {
    
    func startLoading(view: UIView? = nil) {
        guard let position = HXIBButtonActivityPosition(rawValue: activityPosition) else { return }
        /// 开始转菊花
        activityView.startAnimating()
        /// 设置loadingView并禁用交互
        loadingView = view ?? self
        loadingView?.isUserInteractionEnabled = false
        /// 如果菊花在中间，暂时隐藏按钮标题
        if position == .center {
            tempTitle = currentTitle
            setTitle("", for: .normal)
        }
    }
    
    func stopLoading() {
        guard let position = HXIBButtonActivityPosition(rawValue: activityPosition) else { return }
        /// 结束转菊花
        activityView.stopAnimating()
        /// 恢复loadingView的交互
        loadingView?.isUserInteractionEnabled = true
        loadingView = nil
        /// 恢复按钮标题
        if position == .center {
            setTitle(tempTitle, for: .normal)
            tempTitle = nil
        }
    }
    
}






