//
//  MenuCollectionViewCell.swift
//  CollectionViewDiffableDataSource1
//
//  Created by LABORATORIO MAC UAM on 31/8/24.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
