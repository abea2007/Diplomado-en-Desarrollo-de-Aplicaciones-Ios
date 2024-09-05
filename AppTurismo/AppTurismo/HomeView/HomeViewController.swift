import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    var collectionView: UICollectionView!
    var searchBar: UISearchBar!
    var filteredPlaceImages = [String]()
    
    let recommendedImages = ["CornIsland", "MontelimarBeach"]
    let placeImages = ["Granada", "VolcanMasaya", "Leon", "SanJuanDelSur", "IslaDelAmor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        filteredPlaceImages = placeImages
        setupSearchBar()
        setupCollectionView()
        self.navigationItem.hidesBackButton = true
    }
    
    
    func setupSearchBar(){
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search Places..."
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -30),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
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
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
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
            return filteredPlaceImages.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as! RecommendedCell
            cell.configure(with: "Recommendation \(indexPath.item + 1)", imageName: recommendedImages[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedPlaceCell", for: indexPath) as! RecommendedPlaceCell
            let placeNumber = indexPath.item + 1
            
            if placeNumber == 1 {
                cell.configure(with: "Granada", subtitle: "Nicaragua", imageName: placeImages[indexPath.item]) {
                    self.navigateToPlaceOneViewController() // Para el primer botón
                }
            } else if placeNumber == 2 {
                cell.configure(with: "Volcán Masaya", subtitle: "Nicaragua", imageName: placeImages[indexPath.item]) {
                    self.navigateToPlaceTwoViewController() // Para el segundo botón
                }
            } else if placeNumber == 3 {
                cell.configure(with: "Leon", subtitle: "Nicaragua", imageName: placeImages[indexPath.item]) {
                    self.navigateToThirdViewController() // Para el tercer botón
                }
            } else if placeNumber == 4{
                cell.configure(with: "San Juan del Sur", subtitle: "Nicaragua", imageName: placeImages[indexPath.item]){
                    self.navigateToFourViewController()
                }
            } else if placeNumber == 5{
                cell.configure(with: "Isla del Amor", subtitle: "Managua, Nicaragua", imageName: placeImages[indexPath.item]){
                    self.navigateToFiveViewController()
                }
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
    func navigateToPlaceTwoViewController() {
        let secondVC = PlaceTwoViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func navigateToThirdViewController() {
        let thirdVC = ThirdViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    func navigateToFourViewController(){
        let fourVC = FourViewController()
        navigationController?.pushViewController(fourVC, animated: true)
    }
    
    func navigateToFiveViewController(){
        let fiveVC = FiveViewController()
        navigationController?.pushViewController(fiveVC, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
               filteredPlaceImages = placeImages
           } else {
               filteredPlaceImages = placeImages.filter { $0.lowercased().contains(searchText.lowercased()) }
           }
           collectionView.reloadData()
       }

    
    
    
    
}

