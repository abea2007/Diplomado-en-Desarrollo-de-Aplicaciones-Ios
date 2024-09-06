//
//  ViewController.swift
//  InterfazDos
//
//  Created by User-UAM on 9/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    let myCustomModel: [MyCustomStruct] = [
        
        MyCustomStruct(myImage: UIImage(named: "Cyrus")!, myLabel: "Listening to Lonely Day By", myHeadphoneone: UIImage(named: "Cyrus")!, mylabeltwo: "System of a Down", mylabelthird: "Album: Hypnotize -2005"),
        MyCustomStruct(myImage: UIImage(named: "Olivia")!, myLabel: "Listening to Lonely Day By", myHeadphoneone: UIImage(systemName: "headphones")!, mylabeltwo: "System of a Down", mylabelthird: "Album: Hypnotize -2005"),
        MyCustomStruct(myImage: UIImage(named: "Beyonce")!, myLabel: "Listening to Lonely Day By", myHeadphoneone: UIImage(named: "Beyonce")!, mylabeltwo: "System of a Down", mylabelthird: "Album: Hypnotize -2005"),
        MyCustomStruct(myImage: UIImage(named: "Billie")!, myLabel: "Listening to Lonely Day By", myHeadphoneone: UIImage(named: "Billie")!, mylabeltwo: "System of a Down", mylabelthird: "Album: Hypnotize -2005"),
        MyCustomStruct(myImage: UIImage(named: "Sheeran")!, myLabel: "Listening to Lonely Day By", myHeadphoneone: UIImage(named: "Sheeran")!, mylabeltwo: "System of a Down", mylabelthird: "Album: Hypnotize -2005"),
        MyCustomStruct(myImage: UIImage(named: "DuaLipa")!, myLabel: "Listening to Lonely Day By", myHeadphoneone: UIImage(named: "DuaLipa")!, mylabeltwo: "System of a Down", mylabelthird: "Album: Hypnotize -2005"),
        MyCustomStruct(myImage: UIImage(named: "Sia")!, myLabel: "Listening to Lonely Day By", myHeadphoneone: UIImage(named: "Sia")!, mylabeltwo: "System of a Down", mylabelthird: "Album: Hypnotize -2005"),
        MyCustomStruct(myImage: UIImage(named: "TheWeekend")!, myLabel: "Listening to Lonely Day By", myHeadphoneone: UIImage(named: "TheWeekend")!, mylabeltwo: "System of a Down", mylabelthird: "Album: Hypnotize -2005")
        
    
    
    ]
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var ImageAdele: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Cambiar formato a circulo
        ImageAdele.layer.cornerRadius = ImageAdele.frame.size.width / 2
        myCollectionView.register(UINib(nibName: "CellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")

        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }

    
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myCustomModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollectionViewCell
        
        
        cell.config(data: myCustomModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(myCustomModel[indexPath.row].myLabel)
    }
    
    
}

    

