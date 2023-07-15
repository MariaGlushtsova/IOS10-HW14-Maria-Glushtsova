//
//  SearchTabBarViewController.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 15.07.23.
//

import UIKit

class SearchTabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        view.backgroundColor = .systemOrange
    }
        
    @objc func addTapped() {
        
    }
}
