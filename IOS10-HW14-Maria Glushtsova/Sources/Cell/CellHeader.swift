//
//  CellHeader.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 15.07.23.
//

import UIKit

class CellHeader: UICollectionReusableView {
    
    static let identifier = "CellHeader"
    
    // MARK: - Constants
    
    enum Metric {
        static let lineHeight: CGFloat = 1
        static let topIndent: CGFloat = 4
    }
    
    // MARK: - Outlets
    
    lazy var lineSeparator: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray3
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    public func configure() {
        addSubview(lineSeparator)
        addSubview(title)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        title.frame = bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
