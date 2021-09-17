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

protocol AuthManagerProtocol {
    var isLoggedIn: Bool { get }
}

final class StubAuthManager: AuthManagerProtocol {
    var isLoggedIn: Bool = false
}

final class DialogManager {
    private let authManager: AuthManagerProtocol
    init(authManager: AuthManagerProtocol) {
        self.authManager = authManager
    }
    
    var shouldShowLoginDialog: Bool {
        return !authManager.isLoggedIn
    }
    
}


