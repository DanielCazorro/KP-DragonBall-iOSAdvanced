//
//  DataMock.swift
//  KP-DragonBall-iOSAdvancedTests
//
//  Created by Daniel Cazorro Frías on 29/10/23.
//

import Foundation
@testable import KP_DragonBall_iOSAdvanced

class ApiDataMock: ApiProviderProtocol {
    
    private let mockDataHeroes: [[String: Any]] = [
        [
            "id": "CBCFBDEC-F89B-41A1-AC0A-FBDA66A33A06",
            "name": "Piccolo",
            "description": "Es un namekiano que demuestra su sadismo en el 23º Torneo de Artes Marciales donde se enfrenta a Goku y otros oponentes sin escrúpulos. En la final reveló su verdadera identidad y creó pánico entre el público. Separó su lado bueno gracias a la fisión y así Kami creó las bolas de Dragón de la Tierra que casi son destruidas por el propio Piccolo. Llama la atención que tiempo después su carácter haya cambiado tanto. Se vuelve un personaje más amable y dócil, incluso acepta a Son Gohan como su discípulo. Es un punto de inflexión para Piccolo, ya que esta amistad consigue sacar el lado más bondadoso del namekiano que no duda en sacrificarse para defender a Gohan frente a Nappa. De todos los Guerreros Z, es el luchador más estratégico e inteligente. Esto quiere decir que mientras los demás se lanzan a actuar, Piccolo prefiere pensar la mejor opción.",
            "favorite": false,
            "photo": "https://cdn.alfabetajuega.com/alfabetajuega/2020/09/piccolo.jpg?width=300"
        ],
        [
            "id": "D13A40E5-4418-4223-9CE6-D2F9A28EBE94",
            "name": "Goku",
            "description": "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.",
            "favorite": false,
            "photo": "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300"
        ]
    ]
    
    private let mockDataLocations: [[String: Any]] = [
        [
            "dateShow": "2023-01-10T00:00:00Z",
            "hero": [
                "id": "D13A40E5-4418-4223-9CE6-D2F9A28EBE94"
            ],
            "latitud": "38.8202084625344",
            "longitud": "-77.036",
            "id": "DF243536-4F4F-4350-A6A4-046AC3847EA6"
        ]
    ]
    
    required init(secureDataProvider: KP_DragonBall_iOSAdvanced.SecureDataProviderProtocol) {}
    
    func getHeroes(by heroName: String?, token: String, completion: ((KP_DragonBall_iOSAdvanced.Heroes) -> Void)?) {
        do {
            let data = try JSONSerialization.data(withJSONObject: mockDataHeroes)
            let heroes = try? JSONDecoder().decode([Hero].self,
                                                   from: data)
            if let heroName {
                completion?(heroes?.filter { $0.name == heroName } ?? [])
            } else {
                completion?(heroes ?? [])
            }
        } catch {
            completion?([])
        }
    }
    
    func login(for user: String, with password: String) {
        NotificationCenter.default.post(
            name: NotificationCenter.apiLoginNotification,
            object: nil,
            userInfo: [NotificationCenter.tokenKey: "DanielWillBeiOSDeveloper"]
        )
    }
    
    func getLocations(by heroId: String?, token: String, completion: ((KP_DragonBall_iOSAdvanced.HeroLocations) -> Void)?) {
        do {
            let data = try JSONSerialization.data(withJSONObject: mockDataLocations)
            let heroes = try? JSONDecoder().decode([HeroLocation].self,
                                                   from: data)
            
            completion?(heroes ?? [])
        } catch {
            completion?([])
        }
    }
}
