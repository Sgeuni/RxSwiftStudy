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
//        self.stringSequence()
//        self.intArraySequence()
//        self.dicSequence()
        
        rxTestObservable(element: [1,2,3,4,5]).subscribe({ (n) in
            print(n)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func rxTestObservable<E>(element: E) -> Observable<E> {
        return Observable.create({ observer -> Disposable in
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        })
    }
    
//    func stringSequence() {
//        let stringSequence = Observable.just("test string")
//        stringSequence.subscribe { (event: Event<String>) in
//            print(event)
//        }
//    }
//
//    func intArraySequence() {
//        let arraySequence = Observable.from([1,2,3,4,5])
//        arraySequence.subscribe { (event: Event<Int>) in
//            print(event)
//        }
//    }
//
//    func dicSequence() {
//        let dicSequence = Observable.from([1:"Rx", 2:"Swift"])
//        dicSequence.subscribe { (event: Event<(key:Int, value:String)>) in
//            print(event)
//        }
//    }

}

