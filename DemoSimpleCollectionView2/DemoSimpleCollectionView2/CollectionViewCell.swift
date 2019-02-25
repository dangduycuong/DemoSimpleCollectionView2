//
//  CollectionViewCell.swift
//  DemoSimpleCollectionView2
//
//  Created by duycuong on 2/23/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit


protocol CollectionViewCellDelegate: class {
    func onClick(at indexPath: IndexPath)
}

class CollectionViewCell: UICollectionViewCell {
    
    //weak var delegate: CollectionViewCellDelegate?
    weak var delegate: CollectionViewCellDelegate?
    
   // @IBOutlet weak var masterLabel: UILabel!
    @IBOutlet weak var masterImage: UIImageView!
    
    var indexPath: IndexPath!
    
    @IBAction func deleteButton(_ sender: UIButton) {
        if indexPath != nil {
            delegate?.onClick(at: indexPath)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
