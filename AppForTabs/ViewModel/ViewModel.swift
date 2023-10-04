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
    @Published var retangulosII: [DraggableItem]
    @Published var retangulosIII: [DraggableItem]
    @Published var retangulosCasas: [DraggableItem]
    
    init(){
        self.cardsHome = DataService.cardsHome
        self.retangulos = DataService.retangulos
        self.retangulosII = DataService.retangulosII
        self.retangulosIII = DataService.retangulosIII
        self.retangulosCasas = DataService.retangulosCasas
        
    }
    
}
