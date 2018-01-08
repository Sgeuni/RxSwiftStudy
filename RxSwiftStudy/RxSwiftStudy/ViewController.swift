//
//  ViewController.swift
//  RxSwiftStudy
//
//  Created by Yeongeun Song on 2018. 1. 8..
//  Copyright © 2018년 Yeongeun Song. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print((1...10)
            .filter({
                $0 % 2 == 0
            })
            .map({
                $0 * 10
                
            })
            .reduce(0) {$0 + $1})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

