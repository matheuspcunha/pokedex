//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

final class PokemonDetailViewController: UIViewController {
        
    private var viewModel: PokemonDetailViewModelProtocol!
    private var contentView: PokemonDetailView!

    init(viewModel: PokemonDetailViewModelProtocol) {
        self.viewModel = viewModel
        self.contentView = PokemonDetailView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = contentView
    }
}
