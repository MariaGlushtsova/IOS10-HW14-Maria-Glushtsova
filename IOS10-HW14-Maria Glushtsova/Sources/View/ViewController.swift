//
//  ViewController.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 13.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UI
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.identifier)
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0, 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell
            return item ?? UICollectionViewCell()
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as? TableCell
            return item ?? UICollectionViewCell()
        }
    }
}
