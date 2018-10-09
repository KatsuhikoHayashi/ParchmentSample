//
//  ViewController.swift
//  ParchmentSample
//
//  Created by 林克彦 on 2018/09/25.
//  Copyright © 2018年 Katsuhiko Hayashi. All rights reserved.
//

import UIKit
import Parchment

class ViewController: UIViewController {
    
    var pagingViewController: FixedPagingViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // タブに表示するビューの定義（ストーリーボードじ上のコントローラーを指定）
        let firstViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC2") as! ViewController2
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC3") as! ViewController3
        self.pagingViewController = FixedPagingViewController(viewControllers: [
            firstViewController,
            secondViewController
            ])
        
        // タブの装飾
        self.pagingViewController.backgroundColor = UIColor.white            // 非選択時の背景色
        self.pagingViewController.textColor = UIColor.black                  // 非選択時のテキストの色
        self.pagingViewController.selectedBackgroundColor = UIColor.white    // 選択時の背景色
        self.pagingViewController.selectedTextColor = UIColor.red            // 選択時のテキストの色
        self.pagingViewController.indicatorColor = UIColor.red               // 選択時のテキスト下部インジケーターの色
    
        // ビューの範囲一杯に子ビューの内容を表示する
        addChild(self.pagingViewController)
        self.view.addSubview(self.pagingViewController.view)
        self.view.constrainToEdges(self.pagingViewController.view)
        self.pagingViewController.didMove(toParent: self)
    }
}


// Parchmentで使用するビューの制約設定用
extension UIView {
    func constrainToEdges(_ subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let topContraint = NSLayoutConstraint(
            item: subview,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(
            item: subview,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0)
        
        let leadingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0)
        
        let trailingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0)
        
        addConstraints([
            topContraint,
            bottomConstraint,
            leadingContraint,
            trailingContraint])
    }
    
}
