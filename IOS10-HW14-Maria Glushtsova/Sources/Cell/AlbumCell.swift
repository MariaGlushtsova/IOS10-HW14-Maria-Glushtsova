//
//  AlbumCell.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 13.07.23.
//

import UIKit
import SnapKit

final class AlbumCell: UICollectionViewCell {
    
    static let identifier = "AlbumCell"
    
    //MARK: - Constants
    
    enum Metric {
        static let indent: CGFloat = 5
        static let photoRadius: CGFloat = 10
    }
    
    //MARK: - Properties
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Metric.photoRadius
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var nameAlbumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    lazy var numberOfPhotosLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.textColor = .systemGray
        return label
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

extension AlbumCell {
    
    func configure() {
        contentView.addSubviews([
            photoImageView,
            nameAlbumLabel,
            numberOfPhotosLabel
        ])
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(photoImageView.snp.width)
        }

        nameAlbumLabel.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(Metric.indent)
        }

        numberOfPhotosLabel.snp.makeConstraints { make in
            make.top.equalTo(numberOfPhotosLabel.snp.bottom).offset(Metric.indent)
        }
    }
}
