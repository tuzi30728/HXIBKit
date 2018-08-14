//
//  ViewController.swift
//  HXIBKit
//
//  Created by HongXiangWen on 2018/5/25.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func loadingBtnClicked(_ sender: HXIBLoadingButton) {
        sender.startLoading(view: view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            sender.stopLoading()
        })
    }
    

}

