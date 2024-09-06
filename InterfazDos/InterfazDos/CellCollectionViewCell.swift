//
//  CellCollectionViewCell.swift
//  InterfazDos
//
//  Created by User-UAM on 9/5/24.
//

import UIKit

struct MyCustomStruct{
    let myImage: UIImage
    let myLabel: String
    let myHeadphoneone: UIImage
    let mylabeltwo: String
    let mylabelthird: String
}

class CellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myHeadphone: UIImageView!
    
    @IBOutlet weak var myfisrtlabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myThirdLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(data: MyCustomStruct){
        myImageView.image = data.myImage
        myfisrtlabel.text = data.myLabel
        mySecondLabel.text = data.mylabeltwo
        myThirdLabel.text = data.mylabelthird
    }
}
