//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

final class PokemonListViewModel {
    
    weak var view: PokemonListViewProtocol?
    
    private var coordinator: PokemonListCoordinatorProtocol?
    private var pokemonList: [Pokemon] = []

    private let service: PokemonListServiceProtocol

    init(coordinator: PokemonListCoordinatorProtocol,
         service: PokemonListServiceProtocol = PokemonListService()) {
        self.coordinator = coordinator
        self.service = service
    }

    private func getPokemonInList(at index: Int) -> Pokemon {
        updatePokemonIdIfNedeed(index)
        return pokemonList[index]
    }
    
    private func updatePokemonIdIfNedeed(_ index: Int) {
        guard !pokemonList.isEmpty && pokemonList[index].id == nil else {
            return
        }
        pokemonList[index].id = "\(index+1)"
    }

    private func updatePokemonList(with newList: [Pokemon]) {
        self.pokemonList.removeAll()
        self.pokemonList = newList
    }

    private func showDetail(for detail: PokemonDetail) {
        coordinator?.showDetail(for: detail)
    }
    
    private func getPokemonList() {
        view?.showLoading(true)
        
        service.getPokemonList { [weak self] result in
            guard let self = self else { return }
            self.view?.showLoading(false)
            
            switch result {
            case let .success(list):
                guard let pokemonList = list.results else { return }
                self.updatePokemonList(with: pokemonList)
                self.view?.reloadCollectionView()
            case .failure:
                self.showFailureAlert()
            }
        }
    }
    
    private func getPokemon(by id: String, showDetail: Bool = false) {
        view?.showLoading(true)
        
        service.getPokemon(id: id, onComplete: { [weak self] result in
            guard let self = self else { return }
            self.view?.showLoading(false)
            
            switch result {
            case let .success(pokemon):
                if showDetail {
                    self.showDetail(for: pokemon)
                    return
                }
                let pokemon = [Pokemon(name: pokemon.name, id: pokemon.id)]
                self.updatePokemonList(with: pokemon)
                self.view?.reloadCollectionView()
            case .failure:
                self.showFailureAlert()
            }
        })
    }
    
    private func showFailureAlert() {
        let alert = Alert.make(title: "Ops!", message: "Something went wrong =(")
        self.coordinator?.showAlert(alert)
    }
}

extension PokemonListViewModel: PokemonListViewModelProtocol {

    var countPokemons: Int {
        return pokemonList.count
    }

    func fetchPokemonList() {
        getPokemonList()
    }
    
    func fetchPokemon(by id: String) {
        getPokemon(by: id)
    }

    func cellViewModelFor(at indexPath: IndexPath) -> PokemonCellViewModel {
        let pokemon = getPokemonInList(at: indexPath.row)
        return PokemonCellViewModel(pokemon: pokemon)
    }
    
    func openDetailFor(indexPath: IndexPath) {
        guard let id = getPokemonInList(at: indexPath.row).id else { return }
        getPokemon(by: id, showDetail: true)
    }
}
