//
//  TutorialController.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 28/09/23.
//

import Foundation
import CoreData

class TutorialController: ObservableObject {
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func saveContext() {
        do{
            try context.save()
        } catch{
            print("Não foi possível salvar os dados")
        }
    }
    
    func initTutorial(){
        let tutorial = Tutorial(context: context)
        tutorial.enabled = true
        
        saveContext()
    }
    
    func disableTutorial(tutorial: Tutorial){
        tutorial.enabled = false
        saveContext()
    }
    
}
