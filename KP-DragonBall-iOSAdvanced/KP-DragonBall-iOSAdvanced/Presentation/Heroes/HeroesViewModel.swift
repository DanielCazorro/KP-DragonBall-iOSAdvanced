//
//  HeroesViewModel.swift
//  DragonBall
//
//  Created by Daniel Cazorro Frías on 25/10/23.
//

import Foundation

class HeroesViewModel: HeroesViewControllerDelegate {
    // MARK: - Dependencies -
    private let apiProvider: ApiProviderProtocol
    private let secureDataProvider: SecureDataProviderProtocol
    
    // MARK: - Properties -
    var viewState: ((HeroesViewState) -> Void)?
    var heroesCount: Int {
        heroes.count
    }
    
    private var heroes: Heroes = []
    
    
    // MARK: - Initializers -
    init(apiProvider: ApiProviderProtocol,
         secureDataProvider: SecureDataProviderProtocol) {
        self.apiProvider = apiProvider
        self.secureDataProvider = secureDataProvider
    }
    
    // MARK: - Public functions -
    func onViewAppear() {
        viewState?(.loading(true))
        
        DispatchQueue.global().async {
            defer { self.viewState?(.loading(false)) }
            guard let token = self.secureDataProvider.getToken() else { return }
            
            self.apiProvider.getHeroes(by: nil,
                                       token: token) { heroes in
                self.heroes = heroes
                self.viewState?(.updateData)
            }
        }
    }
    
    func heroBy(index: Int) -> Hero? {
        if index >= 0 && index < heroesCount {
            heroes[index]
        } else {
            nil
        }
    }
    
    func heroDetailViewModel(index: Int) -> HeroDetailViewControllerDelegate? {
        guard let selectedHero = heroBy(index: index) else { return nil }
        
        return HeroDetailViewModel(
            hero: selectedHero,
            apiProvider: apiProvider,
            secureDataProvider: secureDataProvider
        )
    }
    
    func deleteToken() {
        secureDataProvider.deleteToken()
    }
}
