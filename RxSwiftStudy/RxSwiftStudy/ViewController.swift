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
        rxFromFunc()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func rxFromFunc() {
        let disposeBag = DisposeBag()
        let testArry = ["0", "1", "2", "3", "4", "5"]
        
        Observable.from(testArry)
            .subscribe(onNext:{print($0)})
            .disposed(by: disposeBag)
    }
    
    func rxDeferFunc() {
        let disposeBag = DisposeBag()
        var count = 1
        let deferredSequence = Observable<String>.deferred { () -> Observable<String> in
            print("\(count) 번째")
            count = count + 1
            
            return Observable.create({ (observer) -> Disposable in
                print("Emitting ... ")
                observer.onNext("next")
                return Disposables.create()
            })
        }
        
        // 아래 주석시 아무 반응이 없음, (defer는 subscribe해야 호출하는 Observable)
        deferredSequence.subscribe(onNext:{print($0)}).disposed(by: disposeBag)
        deferredSequence.subscribe(onNext:{print($0)}).disposed(by: disposeBag)
    }
    
    func rxCreateObservable<E>(element: E) -> Observable<E> {
        return Observable.create({ observer -> Disposable in
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        })
    }
    
    func publishSubjectFunc() {
        let disposeBag = DisposeBag()
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
    
    func behaviorSubjectFunc() {
        let disposeBag = DisposeBag()
        let behaviorSubject = BehaviorSubject(value: "init value")
        behaviorSubject.subscribe { (event) in
            print(event)
        }
        
        behaviorSubject.onNext("first value")
        behaviorSubject.onNext("second value")
        behaviorSubject.onError(NSError(domain: "", code:1, userInfo: nil))
        behaviorSubject.onNext("after Error")
        behaviorSubject.onCompleted()
    }
    
    func replaySubjectFunc() {
        let disposeBag = DisposeBag()
        var replaySubject = ReplaySubject<String>.create(bufferSize: 2)
        replaySubject.onNext("before subscribe first value")
        replaySubject.onNext("before subscribe second value")
        replaySubject.subscribe { (event) in
            print(event)
        }
        replaySubject.onNext("first value")
        replaySubject.onCompleted()
    }
}

