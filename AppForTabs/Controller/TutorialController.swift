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
        
        initTutorial()
    }
    
    func saveContext() {
        do{
            try context.save()
        } catch{
            print("Não foi possível salvar os dados")
        }
    }
    
    func initTutorial(){
        let fetchRequest: NSFetchRequest<Tutorial> = Tutorial.fetchRequest()
        let amountCoreDataItems = try? context.count(for: fetchRequest)
        
        guard amountCoreDataItems == 0 else{
            //ja foi inicializado pela primeira vez
            return
        }
        let tutorial = Tutorial(context: context)
        tutorial.enabled = true
        
        saveContext()
    }
    
    func disableTutorial(tutorial: Tutorial){
        tutorial.enabled = false
        saveContext()
    }
    
    func enableTutorial(tutorial: Tutorial){
        tutorial.enabled = true
        saveContext()
    }
    
}
