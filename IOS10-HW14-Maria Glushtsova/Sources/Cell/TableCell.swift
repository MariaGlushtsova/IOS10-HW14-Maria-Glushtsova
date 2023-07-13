//
//  TableCell.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 13.07.23.
//

import UIKit

final class TableCell: UICollectionViewCell {
    
    static let identifier = "TableCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
