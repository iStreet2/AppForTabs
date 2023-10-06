//
//  ViewModel.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 25/09/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var cardsHome: [CardsHome]
    @Published var retangulos: [DraggableItem]
    @Published var retangulosII: [DraggableItem]
    @Published var retangulosIII: [DraggableItem]
    @Published var retangulosCasas: [DraggableItem]
    @Published var allTrueString: Int
    @Published var allTrueFret: Int
    @Published var page3: Int
    
    init(){
        self.cardsHome = DataService.cardsHome
        self.retangulos = DataService.retangulos
        self.retangulosII = DataService.retangulosII
        self.retangulosIII = DataService.retangulosIII
        self.retangulosCasas = DataService.retangulosCasas
        self.allTrueString = 0
        self.allTrueFret = 0
        self.page3 = 1
        
    }
    func resetRetangulos(){
        for i in 0..<self.retangulos.count{
            self.retangulos[i] = DraggableItem(origin: RectanglesModel(color: Color("Rectangle\(i+1)"), numero: "\(i+1)", id: i+1,x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: i+1, x:54,y:54, linha: true, casa: false))
            self.retangulosIII[i] = DraggableItem(origin: RectanglesModel(color: Color("Rectangle\(i+1)"), numero: "\(i+1)", id: i+1,x:47,y:47, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: i+1, x:47,y:47, linha: true, casa: false))
        }
        for i in 1..<self.retangulos.count{
            self.retangulosII[i] = DraggableItem(origin: RectanglesModel(color: Color("Rectangle\(i+1)"), numero: "\(i+1)", id: i+1,x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: .gray, numero: "", id: i+1, x:54,y:54, linha: true, casa: false))
        }
        self.retangulosII[0] = DraggableItem(origin: RectanglesModel(color: Color("Rectangle1"), numero: "1", id: 1,x:54,y:54, linha: false, casa: false), destination: RectanglesModel(color: Color("Rectangle1"), numero: "1", id: 1, x:54,y:54, linha: true, casa: false))
    }
    
    func resetRetangulosCasas(){
        for i in 1..<self.retangulosCasas.count{
            self.retangulosCasas[i] = DraggableItem(origin: RectanglesModel(color: Color("Rectangle\(i+1)"), numero: "\(i+1)", id: i+1, x:59,y:100, linha: false, casa: true), destination: RectanglesModel(color: .gray, numero: "", id: i+1, x:59,y:100 , linha: true,casa: true))
        }
        self.retangulosCasas[0] = DraggableItem(origin: RectanglesModel(color: Color("Background"), numero: "", id: 1, x:59,y:100, linha: false, casa: true), destination: RectanglesModel(color: Color("Rectangle1"), numero: "1", id: 1, x:59,y:100 , linha: true,casa: true))
    }
    
}
