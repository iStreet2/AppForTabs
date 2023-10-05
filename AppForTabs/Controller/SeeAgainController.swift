//
//  TutorialController.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 28/09/23.
//

import Foundation
import CoreData

class SeeAgainController: ObservableObject {
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
        
        initSeeAgain()
    }
    
    func saveContext() {
        do{
            try context.save()
        } catch{
            print("Não foi possível salvar os dados")
        }
    }
    
    func initSeeAgain(){
        let amountCoreDataItems = try? context.count(for: SeeAgain.fetchRequest())
        
        guard amountCoreDataItems == 0 else{
            //ja foi inicializado pela primeira vez
            return
        }
        let seeAgain = SeeAgain(context: context)
        seeAgain.enabled = true
        
        seeAgain.activitieDone = 0
        seeAgain.stringActivitie = 1
        seeAgain.fretActivitie = 1
        
        
        saveContext()
    }
    
    func disableSeeAgain(seeAgain: SeeAgain){
        seeAgain.enabled = false
        saveContext()
    }
    
    func enableSeeAgain(seeAgain: SeeAgain){
        seeAgain.enabled = true
        saveContext()
    }
    
    func increaseOneActivitie(seeAgain: SeeAgain){
        seeAgain.activitieDone += 1
        saveContext()
    }
    func deacreseOneActivitie(seeAgain: SeeAgain){
        seeAgain.activitieDone -= 1
        saveContext()
    }
    func saveStageFret(seeAgain: SeeAgain){
        seeAgain.fretActivitie += 1
        saveContext()
    }
    func resetStagesFret(seeAgain: SeeAgain){
        seeAgain.fretActivitie = 1
        saveContext()
    }
    func saveStageString(seeAgain: SeeAgain){
        seeAgain.stringActivitie += 1
        saveContext()
    }
    func resetStagesString(seeAgain: SeeAgain){
        seeAgain.stringActivitie = 1
        saveContext()
    }
}
