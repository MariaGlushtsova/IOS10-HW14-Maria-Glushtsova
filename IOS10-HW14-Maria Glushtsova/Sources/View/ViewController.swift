//
//  ViewController.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 13.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    enum Metric {
        static let layoutIndent: CGFloat = 12
        static let leftIndentLayout: CGFloat = 6
        static let photoRadius: CGFloat = 5
        static let topIndentVerticalSection: CGFloat = 18
    }
    
    private var model = DataManager.shared.createModels()
    
    //MARK: - UI
    
    private lazy var collection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.identifier)
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.identifier)
        collectionView.register(CellHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupView() {
        title = "Альбомы"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
    }
    
    private func setupHierarchy() {
        view.addSubview(collection)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func addTapped() {

    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return model[0].count
        case 1:
            return model[1].count
        case 2:
            return model[2].count
        case 3:
            return model[3].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = model[indexPath.section][indexPath.item]
        
        switch indexPath.section {
        case 0, 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as? AlbumCell
            item?.photoImageView.image = UIImage(named: data.image)
            item?.nameAlbumLabel.text = data.name
            item?.numberOfPhotosLabel.text = data.imageCount
            return item ?? UICollectionViewCell()
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as? TableCell
            item?.iconView.image = UIImage(systemName: data.image)
            item?.nameLabel.text = data.name
            if data.name == "Анимированные" || data.name == "Недавно удаленные" {
                item?.lineSeparators.backgroundColor = .white
            }
            item?.numberOfPhotosLabel.text = data.imageCount
            item?.lockImageView.image = UIImage(systemName: data.lockImage ?? "")
            return item ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.configure()
            header.title.text = "Мои альбомы"
            header.lineSeparator.frame = CGRect(x: 0, y: 0, width: 390, height: 1)
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.configure()
            header.title.text = "Люди и места"
            header.lineSeparator.frame = CGRect(x: 0, y: 0, width: 390, height: 1)
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.configure()
            header.title.text = "Типы медиафайлов"
            header.lineSeparator.frame = CGRect(x: 0, y: 0, width: 390, height: 1)
            return header
        case 3:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellHeader.identifier, for: indexPath) as! CellHeader
            header.configure()
            header.title.text = "Другое"
            header.lineSeparator.frame = CGRect(x: 0, y: 0, width: 390, height: 1)
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CellHeader
            return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = MediaTabBarViewController()
        collectionView.deselectItem(at: indexPath, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
        let data = model[indexPath.section][indexPath.item]
        data.handler()
    }
}

enum Sections: Int {
    case first = 0
    case second = 1
    case third = 2
    case fourth = 3
}

extension ViewController {
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int,
             layoutEnvironment: NSCollectionLayoutEnvironment) ->
            NSCollectionLayoutSection? in
            
            guard let sectionLayout = Sections(rawValue: sectionIndex) else { return nil }
            
            switch sectionLayout {
            case .first:
                return self.firstSection()
            case .second:
                return self.secondSection()
            case .third:
                return self.thirdSection()
            case .fourth:
                return self.fourthSection()
            }
        }
        return layout
    }
}

extension ViewController {
    
    private func firstSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: Metric.layoutIndent,
            leading: Metric.leftIndentLayout,
            bottom: .zero,
            trailing: Metric.leftIndentLayout
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(192),
            heightDimension: .estimated(300)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )
        
        group.interItemSpacing = .fixed(88)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = .zero
        section.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: Metric.layoutIndent,
            bottom: 112,
            trailing: Metric.layoutIndent
        )
        section.orthogonalScrollingBehavior = .paging
        
        section.contentInsets.leading = Metric.layoutIndent
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(40))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [layoutSectionHeader]
        
        return section
    }
    
    private func secondSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: Metric.leftIndentLayout,
            bottom: .zero,
            trailing: Metric.leftIndentLayout
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(192),
            heightDimension: .estimated(186)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: Metric.layoutIndent,
            bottom: 60,
            trailing: Metric.layoutIndent
        )
        section.orthogonalScrollingBehavior = .paging
        
        section.contentInsets.leading = Metric.layoutIndent
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(40))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [layoutSectionHeader]
        
        return section
    }
    
    private func thirdSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(40)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: .zero,
            bottom: .zero,
            trailing: .zero
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: itemSize,
            subitem: item,
            count: 1
        )
         
        let section = NSCollectionLayoutSection(group: group)

        section.contentInsets.leading = Metric.layoutIndent
        section.contentInsets.bottom = Metric.topIndentVerticalSection

        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(40))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [layoutSectionHeader]
        
        return section
    }
    
    private func fourthSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(40)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: .zero,
            bottom: .zero,
            trailing: .zero
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: itemSize,
            subitem: item,
            count: 1
        )
         
        let section = NSCollectionLayoutSection(group: group)

        section.contentInsets.leading = Metric.layoutIndent

        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(40))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [layoutSectionHeader]
        
        return section
    }
}
