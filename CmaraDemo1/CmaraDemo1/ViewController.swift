//
//  ViewController.swift
//  CmaraDemo1
//
//  Created by LABORATORIO MAC UAM on 21/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<MediaType, MediaModel>
    typealias Snapchot = NSDiffableDataSourceSnapshot<MediaType, MediaModel>
    
    @IBOutlet weak var collectionView: UICollectionView!
    private lazy var dataSource = makeDataSource()
    
    private var medias = [MediaModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Library"
        
        configButtons()
        cellRegistration()
        layoutConfiguration()
    }
    
    private func cellRegistration(){
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
    }
    private func makeDataSource() -> DataSource{
        let dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell
            
            cell?.ImageView.image = itemIdentifier.image
            return cell
        }
        
        return dataSource
    }
    
    private func layoutConfiguration(){
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { indexPath, environment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(150))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        })
    }
    
    func configButtons(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addMedia))
    }
    
    func applySnapshot(){
        var snapshot = Snapchot()
        
        snapshot.appendSections([.photo])
        
        snapshot.appendItems(medias)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    @objc func addMedia(){
        let newphoto = MediaModel(type: .photo, image: UIImage(systemName: "plus")!)
        medias.append(newphoto)
        applySnapshot()
        
    }


}

