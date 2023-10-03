//
//  ViewModel.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 25/09/23.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var cardsHome: [CardsHome]
    @Published var retangulos: [DraggableItem]
    @Published var retangulosCasas: [DraggableItem]
    
    init(){
        self.cardsHome = DataService.cardsHome
        self.retangulos = DataService.retangulos
        self.retangulosCasas = DataService.retangulosCasas
        
    }
}
