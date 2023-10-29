//
//  MapNotes.swift
//  KP-DragonBall-iOSAdvanced
//
//  Created by Daniel Cazorro Frías on 28/10/23.
//

import UIKit
import MapKit

class MapNotes: NSObject, MKAnnotation {
    var name: String?
    var coordinate: CLLocationCoordinate2D
    var information: String?
    
    init(name: String? = nil, coordinate: CLLocationCoordinate2D, information: String? = nil) {
        self.name = name
        self.coordinate = coordinate
        self.information = information
    }
}
