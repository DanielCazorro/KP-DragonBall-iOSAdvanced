//
//  SplashViewController.swift
//  KP-DragonBall-iOSAdvanced
//
//  Created by Daniel Cazorro Frías on 27/10/23.
//

import UIKit

protocol SplashViewControllerDelegate {
    var viewState: ((SplashViewState) -> Void)? { get set }
    
    func onViewAppear()
}

enum SplashViewState {
    case loading(_ isLoading: Bool)
    case navigateToLogin
    case navigateToHeroes
}

class SplashViewController: UIViewController {
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var viewModel: SplashViewControllerDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        viewModel?.onViewAppear()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SPLASH_TO_LOGIN":
            break
            
        case "SPLASH_TO_HEROES":
            break
            
        default:
            break
        }
    }
    
    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .loading(let isLoading):
                    self?.loading.isHidden = !isLoading
                    
                case .navigateToLogin:
                    self?.performSegue(withIdentifier: "SPLASH_TO_LOGIN", sender: nil)
                    
                case .navigateToHeroes:
                    self?.performSegue(withIdentifier: "SPLASH_TO_HEROES", sender: nil)
                    
                }
            }
        }
    }
}
   
