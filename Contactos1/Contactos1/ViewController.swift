import UIKit
import CoreData

class ViewController: UIViewController, UISearchBarDelegate {
    
    var contactos = [Contacto]()
    var contactosFiltrados = [Contacto]() // Para almacenar los resultados de la búsqueda
    var buscando = false // Para saber si se está buscando
    
    @IBOutlet weak var TablaContactos: UITableView!
     
    @IBOutlet weak var barraBusqueda: UISearchBar!
    @IBOutlet weak var tituloLabel: UILabel!
    
    func conexion() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contactos"
        // Configurar la barra de búsqueda
        barraBusqueda.delegate = self
        
        // Cargar los datos desde Core Data
        cargarInfoCoreData()
        
        print(contactos)
        
        // Asignar el delegate y dataSource a la tabla
        TablaContactos.delegate = self
        TablaContactos.dataSource = self
    }

    @IBAction func agregarContactos(_ sender: Any) {
        // Configura la alerta
        let alert = UIAlertController(title: "Agregar Contacto", message: "Nuevo Contacto", preferredStyle: .alert)
        
        alert.addTextField { (nombreAlert) in
            nombreAlert.placeholder = "Nombre"
        }
        alert.addTextField { (telefonoAlert) in
            telefonoAlert.placeholder = "Teléfono"
            telefonoAlert.keyboardType = .numberPad
        }
        alert.addTextField { (direccionAlert) in
            direccionAlert.placeholder = "Dirección"
        }
        
        // Configura la acción de Aceptar
        let actionAceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            guard let nombreAlert = alert.textFields?[0].text,
                  let telefonoAlert = alert.textFields?[1].text,
                  let direccionAlert = alert.textFields?[2].text else { return }
            
            guard !nombreAlert.isEmpty, !telefonoAlert.isEmpty, !direccionAlert.isEmpty else {
                print("Todos los campos son obligatorios")
                return
            }
            
            // Guardar en Core Data
            let contexto = self.conexion()
            let entidadContacto = NSEntityDescription.insertNewObject(forEntityName: "Contacto", into: contexto) as! Contacto
            
            entidadContacto.nombre = nombreAlert
            entidadContacto.telefono = Int64(telefonoAlert) ?? 0
            entidadContacto.direccion = direccionAlert
            
            do {
                try contexto.save()
                print("Contacto guardado correctamente!")
                
                // Recargar los datos desde Core Data
                self.cargarInfoCoreData()
                self.TablaContactos.reloadData()
            } catch let error as NSError {
                print("Error al guardar en la BD: \(error.localizedDescription)")
            }
        }
        
        let actionCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        // Añadir las acciones al UIAlertController
        alert.addAction(actionAceptar)
        alert.addAction(actionCancelar)
        
        // Presentar la alerta
        present(alert, animated: true, completion: nil)
    }
    
    func cargarInfoCoreData() {
        let contexto = conexion()
        
        let fetchRequest: NSFetchRequest<Contacto> = Contacto.fetchRequest()
        do {
            contactos = try contexto.fetch(fetchRequest)
            contactosFiltrados = contactos // Inicia la lista filtrada igual que la lista original
        } catch let error as NSError {
            print("Error al cargar la info de la BD: \(error.localizedDescription)")
        }
    }
    
    func eliminarContacto(at indexPath: IndexPath) {
        let contexto = conexion()
        let contactoAEliminar = contactosFiltrados[indexPath.row] // Usa la lista filtrada
        
        contexto.delete(contactoAEliminar)
        
        do {
            try contexto.save()
            print("Contacto eliminado correctamente!")
            
            // Actualizar la lista original y la filtrada
            if let index = contactos.firstIndex(of: contactoAEliminar) {
                contactos.remove(at: index)
            }
            contactosFiltrados.remove(at: indexPath.row)
            
            TablaContactos.deleteRows(at: [indexPath], with: .automatic)
        } catch let error as NSError {
            print("Error al eliminar el contacto: \(error.localizedDescription)")
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            contactosFiltrados = contactos
        } else {
            contactosFiltrados = contactos.filter { contacto in
                contacto.nombre?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
        TablaContactos.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        contactosFiltrados = contactos
        TablaContactos.reloadData()
        searchBar.resignFirstResponder()
    }
}

// Extensión que implementa UITableViewDelegate y UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactosFiltrados.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contacto = contactosFiltrados[indexPath.row]
        
        celda.textLabel?.text = contacto.nombre
        celda.detailTextLabel?.text = String(contacto.telefono)
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let contactoSeleccionado = contactosFiltrados[indexPath.row]
        print("Contacto seleccionado: \(contactoSeleccionado.nombre ?? "Sin nombre")")
    }
    
    // Método para habilitar el gesto de deslizar para eliminar
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            eliminarContacto(at: indexPath)
        }
    }
}
