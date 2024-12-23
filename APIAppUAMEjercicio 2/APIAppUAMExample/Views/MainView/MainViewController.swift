//
//  MainViewController.swift
//  APIAppUAMExample
//
// Created by Carlos Abea on 3/11/24.

//

import UIKit

enum Section  {
    case main
}

class MainViewController: UIViewController {
    
    typealias DataSource = UITableViewDiffableDataSource<Section, ProductModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ProductModel>
    
    private let mainController = MainController()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search products"
        searchController.searchResultsUpdater = self
        
        return searchController
    }()
    
    @IBOutlet weak var tableView: UITableView!
    
    private var products = [ProductModel]()
    
    private lazy var dataSource: DataSource = {
        let dataSource = DataSource(tableView: tableView) { [weak self] tableView, indexPath, productModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell
            cell?.titleProductLabel.text = productModel.title
            cell?.priceProductLabel.text = "$\(productModel.price)"
            
            Task {
                cell?.imageProductView.image = await self?.mainController.loadImage(url: productModel.thumbnail)
            }
            
            return cell
        }
        
        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        
        searchControllerConfiguration()
        configureButtons()
        registerCell()
        configureLogoutButton()
        
        tableView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        Task {
            products = await mainController.getProducts() ?? []
            applySnapshot()
        }
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    private func configureButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProduct))
    }
    
    @objc func addProduct() {
        performSegue(withIdentifier: "goToAddProduct", sender: self)
    }
    
    private func searchControllerConfiguration() {
        navigationItem.searchController = searchController
    }
    
    func applySnapshot() {
        var snapshot = Snapshot()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(products)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    private func configureLogoutButton() {
        // Eliminar cualquier rightBarButtonItem existente
        navigationItem.leftBarButtonItem = nil
        
        // Crear el botón de Logout
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        
        // Asignar el botón a la barra de navegación
        navigationItem.leftBarButtonItem = logoutButton
    }

    @objc func logoutTapped() {
        // LLamar a funcion para eliminar el token del usuario para cerrar sesión
        removeUserSession()
        
        navigationController?.popToRootViewController(animated: true)
    }
    private func removeUserSession() {
        //esto es para Borrar el token del usuario de UserDefaults u otro lugar donde se haya almacenado
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.synchronize()
        
    }
    
    
}


// MARK: - UISearchResultsUpdating

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        
        Task {
            products = await mainController.getProducts(query: query) ?? []
            applySnapshot()
        }
    }
}

// MARK: TableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    // Función que se llama cuando el usuario desliza una celda.
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Crear una acción para ver los detalles del producto.
        let detailAction = UIContextualAction(style: .normal, title: "Detalle") { (action, view, completionHandler) in
            let product = self.products[indexPath.row]
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let productDetailVC = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
                productDetailVC.productId = product.id
                self.navigationController?.pushViewController(productDetailVC, animated: true)
            }
            completionHandler(true) // Indica que la acción fue completada.
        }
        
        // Personalizar el botón (color, icono, etc.)
        detailAction.backgroundColor = .systemBlue
        detailAction.image = UIImage(systemName: "info.circle") // Opcional: agregar un icono
        
        // Crear la configuración de swipe que incluye la acción de detalle.
        let configuration = UISwipeActionsConfiguration(actions: [detailAction])
        return configuration
    }
}

