//
//  PlaceOneViewController.swift
//  AppTurismo
//
//  Created by User-UAM on 9/2/24.
//

import UIKit

class PlaceOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
                
                let label = UILabel()
                label.text = "Bienvenido a Place 1"
                label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(label)
                
                NSLayoutConstraint.activate([
                    label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
            }
        }
