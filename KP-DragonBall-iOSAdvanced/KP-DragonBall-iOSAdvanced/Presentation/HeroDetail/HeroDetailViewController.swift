//
//  HeroDetailViewController.swift
//  DragonBall
//
//  Created by Daniel Cazorro Frías on 28/10/23.
//

import UIKit
import MapKit
import Kingfisher

protocol HeroDetailViewControllerDelegate {
    var viewState: ((HeroDetailViewState) -> Void)? {get set}
    
    func onViewAppear()
}

enum HeroDetailViewState {
    case loading(_ isLoading: Bool)
    case update(hero: Hero?, locations: HeroLocations)
}

class HeroDetailViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var heroDescription: UITextView!
    
    @IBAction func closeButtom() {
        navigationController?.popViewController(animated: true)
    }
    
    var viewModel: HeroDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setObservers()
        viewModel?.onViewAppear()
    }
    
    private func initViews() {
        
    }
    
    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .loading(_):
                    break
                    
                case .update(let hero, let locations):
                    self?.updateViews(hero: hero,
                                      heroLocations: locations)
                }
            }
        }
    }
    
    private func updateViews(hero: Hero?, heroLocations: HeroLocations) {
        photo.kf.setImage(with: URL(string: hero?.photo ?? ""))
        makeRounded(image: photo)
        
        name.text = hero?.name
        heroDescription.text = hero?.description
        
        if let showPlace = heroLocations.first {
            let latitudeLongitude = CLLocationCoordinate2D(
                latitude: Double(showPlace.latitude!) ?? 0.0,
                longitude: Double(showPlace.longitude!) ?? 0.0
            )

            showLocationHero(coordinate: latitudeLongitude)
            
            heroLocations.forEach {
                mapView.addAnnotation(
                    MapNotes(name: hero?.name,
                             coordinate: .init(
                                latitude: Double($0.latitude ?? "") ?? 0.0,
                                longitude: Double($0.longitude ?? "") ?? 0.0),
                             information: hero?.id
                            )
                )
            }
        }
    }
    
    private func showLocationHero(coordinate: CLLocationCoordinate2D) {
            let placeRadius: CLLocationDistance = 2000

            let place = MKCoordinateRegion(
                center: coordinate,
                latitudinalMeters: placeRadius,
                longitudinalMeters: placeRadius
            )
            mapView.setRegion(place, animated: true)
        }

    // Function for image by David Jardón
    private func makeRounded(image: UIImageView) {
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.6)
        image.layer.cornerRadius = image.frame.height / 2
        image.layer.masksToBounds = false
        image.clipsToBounds = true
    }
}
