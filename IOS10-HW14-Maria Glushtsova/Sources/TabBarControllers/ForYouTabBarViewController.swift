//
//  ForYouTabBarViewController.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 15.07.23.
//

import UIKit

class ForYouTabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Для Вас"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        view.backgroundColor = .systemGreen
    }
    
    @objc func addTapped() {
        
    }
}
