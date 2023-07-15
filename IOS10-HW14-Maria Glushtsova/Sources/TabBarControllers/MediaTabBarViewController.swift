//
//  MediaTabBarViewController.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 15.07.23.
//

import UIKit

class MediaTabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Медиатека"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        view.backgroundColor = .systemPink
    }
    
    @objc func addTapped() {
        
    }
}
