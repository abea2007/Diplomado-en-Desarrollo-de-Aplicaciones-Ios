import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    
    let recommendedImages = ["recommended1", "recommended2"]
    let placeImages = ["place1", "place2", "place3", "place4", "place5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(RecommendedCell.self, forCellWithReuseIdentifier: "RecommendedCell")
        collectionView.register(RecommendedPlaceCell.self, forCellWithReuseIdentifier: "RecommendedPlaceCell")

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return recommendedImages.count
        } else {
            return placeImages.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as! RecommendedCell
            cell.configure(with: "Recommendation \(indexPath.item + 1)", imageName: recommendedImages[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedPlaceCell", for: indexPath) as! RecommendedPlaceCell
            cell.configure(with: "Place \(indexPath.item + 1)", subtitle: "Subtitle for Place \(indexPath.item + 1)", imageName: placeImages[indexPath.item]) {
                self.navigateToPlaceOneViewController()
            }
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width - 40, height: 200)
        } else {
            return CGSize(width: collectionView.frame.width - 40, height: 100)
        }
    }

    func navigateToPlaceOneViewController() {
        let placeOneVC = PlaceOneViewController()
        navigationController?.pushViewController(placeOneVC, animated: true)
    }
    
    
    
    
}
