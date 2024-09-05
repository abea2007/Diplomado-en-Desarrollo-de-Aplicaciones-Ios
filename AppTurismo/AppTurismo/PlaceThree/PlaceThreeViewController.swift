import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
       
        let placeImageView = UIImageView()
        placeImageView.contentMode = .scaleAspectFill
        placeImageView.image = UIImage(named: "Leon")
        placeImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeImageView)

        // Label para la descripción del lugar en la parte inferior
        let descriptionLabel = UILabel()
        descriptionLabel.text = "León, una de las ciudades más antiguas de Nicaragua, es un destino vibrante y lleno de historia que captura la esencia cultural del país. Fundada en 1524, esta ciudad te recibe con sus impresionantes catedrales, calles llenas de arte y una atmósfera bohemia que seduce a cualquier visitante. El punto central de León es su majestuosa Catedral de la Asunción, la más grande de Centroamérica y Patrimonio de la Humanidad por la UNESCO. Sube a su icónico techo blanco para disfrutar de una vista panorámica de la ciudad y de los volcanes que la rodean. León es conocida también por ser cuna de grandes poetas, como el famoso Rubén Darío, cuyo museo está dedicado a su legado literario. Para los aventureros, el Cerro Negro, un volcán cercano, ofrece la experiencia única de practicar volcano boarding, una emocionante actividad que te permitirá deslizarte por las laderas de ceniza volcánica. Y si prefieres algo más relajado, puedes recorrer las playas cercanas de Las Peñitas o Poneloya, perfectas para descansar y disfrutar del Pacífico nicaragüense."
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
            placeImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5), 

            // Descripción ocupando toda la parte inferior con espacio para los botones
            descriptionLabel.topAnchor.constraint(equalTo: placeImageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80), // Deja espacio para los botones

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
