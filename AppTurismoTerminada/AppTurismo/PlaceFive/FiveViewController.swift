import UIKit

class FiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        
        let placeImageView = UIImageView()
        placeImageView.contentMode = .scaleAspectFill
        placeImageView.image = UIImage(named: "IslaDelAmor")
        placeImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeImageView)

        // Label para la descripción del lugar en la parte inferior
        let descriptionLabel = UILabel()
        descriptionLabel.text = "La Isla del Amor, situada en el majestuoso Lago Xolotlán, es un destino encantador y romántico, perfecto para una escapada inolvidable. A solo 30 minutos en barco desde el Puerto Salvador Allende en Managua, el viaje hacia la isla es una aventura en sí misma, con guías que comparten historias y curiosidades del lugar. Al llegar, te recibe un entorno natural exuberante y vistas impresionantes que te invitan a relajarte y disfrutar. La isla cuenta con diversas instalaciones diseñadas para tu comodidad y disfrute. Encontrarás cabañas acogedoras, áreas de picnic, zonas para hamacas, un restaurante y piscinas tanto para adultos como para niños. Además, hay senderos que puedes explorar y un pozo de los deseos que añade un toque de magia a tu visita. Las actividades son variadas, desde nadar en las piscinas, hacer un picnic, hasta relajarte en una hamaca bajo la sombra de los árboles."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.textAlignment = .center
        descriptionLabel.backgroundColor = UIColor.systemGray6 // Fondo bonito
        descriptionLabel.layer.cornerRadius = 12
        descriptionLabel.clipsToBounds = true
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)

        // Iconos (corazón)
        let heartIcon = UIButton(type: .system)
        heartIcon.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        heartIcon.tintColor = .red
        heartIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heartIcon)

        // Icono adicional (compartir)
        let shareIcon = UIButton(type: .system)
        shareIcon.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareIcon.tintColor = .blue
        shareIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shareIcon)

        // Constraints
        NSLayoutConstraint.activate([
           
            placeImageView.topAnchor.constraint(equalTo: view.topAnchor),
            placeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            placeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            placeImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5), // 50% de la pantalla

            // Descripción ocupando toda la parte inferior con espacio para los botones
            descriptionLabel.topAnchor.constraint(equalTo: placeImageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80), 

            // Íconos debajo de la descripción
            heartIcon.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            heartIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            heartIcon.widthAnchor.constraint(equalToConstant: 40),
            heartIcon.heightAnchor.constraint(equalToConstant: 40),

            shareIcon.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            shareIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            shareIcon.widthAnchor.constraint(equalToConstant: 40),
            shareIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
