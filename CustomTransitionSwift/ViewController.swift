//
//  ViewController.swift
//  CustomTransitionSwift
//
//  Created by 凌       陈 on 12/4/17.
//  Copyright © 2017 凌       陈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let pushButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        
        
        pushButton.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        pushButton.center = self.view.center
        pushButton.setTitle("Push", for: .normal)
        pushButton.setTitleColor(UIColor.red, for: .normal)
        pushButton.addTarget(self, action: #selector(pushButtonAction), for: .touchUpInside)
        self.view.addSubview(pushButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func pushButtonAction() {
        let detailVC = DetailViewController()
        self .present(detailVC, animated: true, completion: nil);
    }

   
}

