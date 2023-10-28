//
//  HeroDetailViewController.swift
//  KP-DragonBall-iOSAdvanced
//
//  Created by Daniel Cazorro Frías on 28/10/23.
//

import UIKit
import MapKit

class HeroDetailViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var heroDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
