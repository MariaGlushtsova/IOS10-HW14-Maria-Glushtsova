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
    }
    
    // MARK: - Properties
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var numberOfPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    lazy var chevronButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        let image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))?
            .withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray
        return line
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension TableCell {
    
    func configure() {
        contentView.addSubviews([
            iconView,
            lineSeparators,
            nameLabel,
            chevronButton,
            numberOfPhotosLabel
        ])
        
        iconView.snp.makeConstraints { make in
            make.height.equalTo(Metric.iconSize)
            make.width.equalTo(Metric.iconSize)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Metric.indent)
        }
        
        lineSeparators.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(Metric.lineHeight)
            make.leading.equalToSuperview().offset(Metric.lineIndent)
            make.trailing.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Metric.lineIndent)
        }
        
        chevronButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(Metric.iconSize)
            make.width.equalTo(Metric.iconSize)
            make.trailing.equalToSuperview().offset(-Metric.indent)
        }
        
        numberOfPhotosLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(chevronButton.snp.leading).offset(-Metric.lineHeight)
        }
    }
}
