//
//  DataController.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 28/09/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores{ descricao, erro in
            if let erro = erro{
                print("Erro ao pegar os dados \(erro.localizedDescription)")
            }
        }
    }
    
}
