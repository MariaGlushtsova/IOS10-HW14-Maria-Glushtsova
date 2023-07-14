//
//  TableCell.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 13.07.23.
//

import UIKit

final class TableCell: UICollectionViewCell {
    
    static let identifier = "TableCell"
    
    // MARK: - Constants
    
    enum Metric {
        static let indent: CGFloat = 4
        static let lineHeight: CGFloat = 1
        static let lineIndent: CGFloat = 48
        static let iconSize: CGFloat = 28
        static let chevronSize: CGFloat = 13
    }
    
    // MARK: - Properties
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberOfPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var chevronButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        let image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))?
            .withTintColor(.systemGray3, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray3
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(iconView)
        contentView.addSubview(lineSeparators)
        contentView.addSubview(nameLabel)
        contentView.addSubview(chevronButton)
        contentView.addSubview(numberOfPhotosLabel)
        contentView.addSubview(lockImageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: Metric.iconSize),
            iconView.widthAnchor.constraint(equalToConstant: Metric.iconSize),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.indent),
            
            lineSeparators.topAnchor.constraint(equalTo: self.bottomAnchor),
            lineSeparators.heightAnchor.constraint(equalToConstant: Metric.lineHeight),
            lineSeparators.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineSeparators.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.lineIndent),
            
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.lineIndent),
            
            chevronButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chevronButton.heightAnchor.constraint(equalToConstant: Metric.chevronSize),
            chevronButton.widthAnchor.constraint(equalToConstant: Metric.chevronSize),
            chevronButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -Metric.indent),
            
            numberOfPhotosLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numberOfPhotosLabel.trailingAnchor.constraint(equalTo: chevronButton.leadingAnchor, constant: -Metric.indent),
            
            lockImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lockImageView.trailingAnchor.constraint(equalTo: chevronButton.leadingAnchor, constant: -Metric.indent)
        ])
    }
}
