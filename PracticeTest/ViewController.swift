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

struct User: Decodable {
    let name: String
}

final class APIManager {
    
    func fetchUser(completion: @escaping ((Result<User, Error>) -> Void)) {
        let url = URL(string: "https://tanaka.com/user")!
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(error))
            }
        }
        session.resume()
    }
    
}

final class UserManager {
    
    static let shared = UserManager()
    private init() { }
    
    private(set) var user: User?
    
    func fetchUser(completion: @escaping (() -> Void)) {
        APIManager().fetchUser { [weak self] result in
            switch result {
                case .success(let user):
                    self?.user = user
                    completion()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
}


