//
//  HeroesViewController.swift
//  DragonBall
//
//  Created by Daniel Cazorro Frías on 25/10/23.
//

import UIKit

// MARK: - View Protocol -
protocol HeroesViewControllerDelegate {
    var viewState: ((HeroesViewState) -> Void)? { get set }
    
    func onViewAppear()
}

// MARK: - Vies State -
enum HeroesViewState {
    case loading(_ isLoading: Bool)
    case updateData
}

// MARK: - Class -
class HeroesViewController: UIViewController {
    // MARK: - IBOutlet -
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    // MARK: - Public Properties -
    var viewModel: HeroesViewControllerDelegate?
    
    // MARK: - LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setObservers()
        viewModel?.onViewAppear()
    }
    
    // MARK: - Private functions -
    private func initViews() {
        tableView.register(
            UINib(nibName: HeroCellView.identifier, bundle: nil),
            forCellReuseIdentifier: HeroCellView.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .loading(let isLoading):
                    break
                    
                case .updateData:
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        HeroCellView.estimateHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeroCellView.identifier,
                                                       for: indexPath) as? HeroCellView else {
            
            return UITableViewCell()
        }
        
        //TODO: Llamar a cell.update
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Navegar a detalle Hero
    }
}
