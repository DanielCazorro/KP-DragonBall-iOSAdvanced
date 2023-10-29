//
//  DataMock.swift
//  KP-DragonBall-iOSAdvancedTests
//
//  Created by Daniel Cazorro Frías on 29/10/23.
//

import Foundation
@testable import KP_DragonBall_iOSAdvanced

class DataMock {
    static let mockToken = "mock_token"
    static let mockHeroes: [Hero] = [
        Hero(id: "1", name: "Goku", description: "Description for Goku", photo: "goku.jpg", isFavorite: false),
        Hero(id: "2", name: "Vegeta", description: "Description for Vegeta", photo: "vegeta.jpg", isFavorite: true)
    ]
}


