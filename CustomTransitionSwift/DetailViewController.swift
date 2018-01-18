//
//  DetailViewController.swift
//  CustomTransitionSwift
//
//  Created by 凌       陈 on 12/4/17.
//  Copyright © 2017 凌       陈. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIViewControllerTransitioningDelegate {

    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellow
        
        backButton.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        backButton.center = self.view.center
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor.red, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        // 自定义present动画进行的一些设置
        self.modalPresentationStyle = .popover
        self.transitioningDelegate  = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc func backButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    // --------------------------------------------------------------------
    //  animationController
    //        present方法会回调此方法
    // --------------------------------------------------------------------
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition()
    }
    
    // --------------------------------------------------------------------
    //  animationController
    //        dismiss方法会回调此方法
    // --------------------------------------------------------------------
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition()
    }
    
    
   
    
}
