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
        
//        rxTestObservable(element: [1,2,3,4,5]).subscribe({ (n) in
//            print(n)
//        })
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
    
    func publicSubjectFunc() {
        let publishSubject = PublishSubject<String>()
        publishSubject.subscribe { (event) in
            print(event)
        }
        
        publishSubject.onNext("first value")
        publishSubject.onNext("second value")
        publishSubject.onError(NSError(domain: "", code:1, userInfo: nil))
        publishSubject.onNext("after Error")
        publishSubject.onCompleted()
    }
    

}

