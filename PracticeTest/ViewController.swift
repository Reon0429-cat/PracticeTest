//
//  ViewController.swift
//  PracticeTest
//
//  Created by 大西玲音 on 2021/09/18.
//

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

protocol LoggerProtocol {
    func sendLog(message: String)
}

final class MockLogger: LoggerProtocol {
    var invokedSendLog = false
    var invokedSendLogCount = 0
    var sendLogProperties = [String]()
    
    func sendLog(message: String) {
        invokedSendLog = true
        invokedSendLogCount += 1
        sendLogProperties.append(message)
    }
}

final class Calculator {
    private let logger: LoggerProtocol
    init(logger: LoggerProtocol) {
        self.logger = logger
    }
    
    private enum CalcAction {
        case add(Int)
        
    }
    private var calcActions = [CalcAction]()
    
    func add(num: Int) {
        calcActions.append(.add(num))
    }
    
    func calc() -> Int {
        logger.sendLog(message: "Start Calc.")
        var total = 0
        calcActions.forEach { calcAction in
            switch calcAction {
                case .add(let num):
                    logger.sendLog(message: "Add \(num).")
                    total += num
            }
        }
        logger.sendLog(message: "Total is \(total)")
        logger.sendLog(message: "Finish calc.")
        return total
    }
    
}
