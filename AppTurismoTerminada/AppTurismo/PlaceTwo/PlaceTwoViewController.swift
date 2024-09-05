import UIKit

class PlaceTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
       
        let placeImageView = UIImageView()
        placeImageView.contentMode = .scaleAspectFill
        placeImageView.image = UIImage(named: "VolcanMasaya")
        placeImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeImageView)

        // Label para la descripción del lugar en la parte inferior
        let descriptionLabel = UILabel()
        descriptionLabel.text = "El Volcán Masaya, uno de los pocos volcanes activos en Nicaragua que puedes explorar de cerca, te ofrece una experiencia inolvidable. Conocido como La Boca del Infierno por los antiguos conquistadores, este coloso tiene un cráter ardiente y humeante que te permitirá asomarte al mismo corazón de la Tierra. Ubicado en el Parque Nacional Volcán Masaya, este destino es ideal para los amantes de la aventura y la naturaleza. Puedes llegar en automóvil hasta el borde del cráter, donde el rugido del volcán y el resplandor de la lava incandescente en la oscuridad nocturna te dejarán sin aliento.Además de sus vistas impresionantes, el parque ofrece senderos que te llevarán a través de paisajes únicos, hogar de una diversa fauna y flora. No te pierdas el museo interpretativo, que te contará la historia geológica y cultural de la zona, y si tienes suerte, podrás observar las erupciones de gases y lava desde un mirador cercano.¡El Volcán Masaya es una experiencia que te conecta con la fuerza pura de la naturaleza y te dejará maravillado!"
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
            placeImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5), //

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
