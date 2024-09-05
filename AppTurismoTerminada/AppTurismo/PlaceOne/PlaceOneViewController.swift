import UIKit

class PlaceOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
      
        let placeImageView = UIImageView()
        placeImageView.contentMode = .scaleAspectFill
        placeImageView.image = UIImage(named: "Granada")
        placeImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeImageView)

        // Label para la descripción del lugar en la parte inferior
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Ubicada a orillas del majestuoso Lago de Nicaragua, Granada es una ciudad colonial llena de encanto y rica en historia. Fundada en 1524, esta joya arquitectónica ofrece calles empedradas, coloridas fachadas y plazas vibrantes que te transportarán a otra época. Pasea por su imponente catedral, explora las misteriosas isletas en bote, o disfruta de su exquisita gastronomía en alguno de sus restaurantes típicos. Granada es también la puerta de entrada a aventuras emocionantes. Desde caminatas por el volcán Mombacho hasta recorridos por el lago y visitas a mercados artesanales, siempre hay algo fascinante por descubrir. Si buscas una mezcla perfecta de historia, cultura y naturaleza, Granada te espera con los brazos abiertos para ofrecerte una experiencia inolvidable. ¡Ven y vive la magia de Nicaragua en Granada"
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
