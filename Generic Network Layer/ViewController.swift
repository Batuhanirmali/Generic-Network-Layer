//
//  ViewController.swift
//  Generic Network Layer
//
//  Created by Talha Batuhan Irmalı on 7.05.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getLocations { result in
            switch result {
            case .success(let success):
                print(success.results ?? "")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
        NetworkManager.shared.getCharacters { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }


}

