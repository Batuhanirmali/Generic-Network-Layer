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
        
        getLocation(page: 4)
        getMultipleCharacter(id: 7)
        
    }

    private func getLocation(page: Int) {
        NetworkManager.shared.getLocations(LocationID: String(page)) { result in
            switch result {
            case .success(let success):
                success.results?.forEach({ location in
                    print(location.name ?? "")
                })
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    private func getMultipleCharacter(id: Int) {
        NetworkManager.shared.getCharacters(CharacterID: String(id)) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

