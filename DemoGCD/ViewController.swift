//
//  ViewController.swift
//  DemoGCD
//
//  Created by Ashish Gour on 24/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        exampleGCD()
        print("end of view did load")
    }
    
    
    private func demo() async {
        
        print("demo")
    }
    
    private func demo1() async {
        
        print("demo1")
    }
    
    
    private func exampleAsyncAwait() {
        
        Task.init {
            await demo()
            await demo1()
        }
        
    }
    
    func exampleGCD() {
        let queue = DispatchQueue(label: "com.demoGCD", qos: .background, attributes: .concurrent)
        
        queue.async {
            print("@@@@@@", Thread.current)
            
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        
        
        queue.async {
            print("@@@@@@", Thread.current)
            for i in 100..<110 {
                print("🟢", i)
            }
        }
        
        DispatchQueue.main.async {
            print("####", Thread.current)
            
        }
    }
    
    func exampleOperarionQueue() {
        let op1 = BlockOperation {
            
            print("@@@@@@", Thread.current)
            
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        
        
        let op2 = BlockOperation {
            
            print("@@@@@@", Thread.current)
            
            for i in 100..<110 {
                print("🟢", i)
            }
        }
        
        
        print("#######", Thread.current)
        
        let queue = OperationQueue()
        
        op1.addDependency(op2)
        
        queue.addOperation(op1)
        
        queue.addOperation(op2)
    }
}
