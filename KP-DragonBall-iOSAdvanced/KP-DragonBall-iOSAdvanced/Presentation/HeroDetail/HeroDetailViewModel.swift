//
//  HeroDetailViewModel.swift
//  DragonBall
//
//  Created by Daniel Cazorro Frías on 28/10/23.
//

import UIKit

class HeroDetailViewModel: HeroDetailViewControllerDelegate {
    private let apiProvider: ApiProviderProtocol
    
    var viewState: ((HeroDetailViewState) -> Void)?
    
    init(apiProvider: ApiProviderProtocol) {
        self.apiProvider = apiProvider
    }
    
    func onViewAppear() {
        viewState?(.loading(true))
        
        DispatchQueue.global().async {
            
        }
    }
    
    
}
