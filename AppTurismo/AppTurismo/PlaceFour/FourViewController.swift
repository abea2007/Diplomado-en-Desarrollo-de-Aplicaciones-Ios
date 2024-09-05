import UIKit

class FourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
       
        let placeImageView = UIImageView()
        placeImageView.contentMode = .scaleAspectFill
        placeImageView.image = UIImage(named: "SanJuanDelSur")
        placeImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeImageView)

        // Label para la descripción del lugar en la parte inferior
        let descriptionLabel = UILabel()
        descriptionLabel.text = "A orillas del Pacífico se encuentra San Juan del Sur, en Nicaragua, un encantador pueblo costero de ambiente relajado que además de ser un destino muy popular entre los turistas por sus playas de arena dorada y agua cristalina, es conocido por su animada vida nocturna con bares y restaurantes que bordean el malecón y donde se puede disfrutar de la música en vivo y espectaculares puestas de sol. En San Juan del Sur no te puedes perder la bahía de San Juan del Sur o la playa de Marsella entre muchos otros rincones donde podrás practicar surf, snorkel y otros deportes acuáticos. Su gente amigable y su ambiente relajado hacen que sea un lugar perfecto para relajarse y disfrutar de la belleza natural de esta región. Así que no lo pienses más y empieza a organizar tu viaje."
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
