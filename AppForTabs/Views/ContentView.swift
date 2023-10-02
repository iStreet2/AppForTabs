//
//  ContentView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var homeView = false
    
    //Coisa do CoreData
    @Environment(\.managedObjectContext) var context //Contexto, DataController
    
    //Coisas do TutorialController
    @ObservedObject var tutorialController: TutorialController
    @FetchRequest(sortDescriptors: []) var tutorial: FetchedResults<Tutorial>
    
    //Coisas do SeeAgainController
    @ObservedObject var seeAgainController: SeeAgainController
    @FetchRequest(sortDescriptors: []) var seeAgain: FetchedResults<SeeAgain> //Vetor de todas minhas instâncias
    
    init(context: NSManagedObjectContext) {
        self.tutorialController = TutorialController(context: context)
        self.seeAgainController = SeeAgainController(context: context)
    }
    
    
    var body: some View {
        if homeView == false{
            if tutorial[0].enabled != false {
                TutorialView(homeView: $homeView, context: context, tutorial: tutorial[0])
            }
            else{
                HomeView(homeView: $homeView, context: context, tutorial: tutorial[0], seeAgain: seeAgain[0])
            }
        }
        else{
            HomeView(homeView: $homeView, context: context, tutorial: tutorial[0], seeAgain: seeAgain[0])
                .transition(.push(from: Edge.trailing))
        }
        
    }
}

//#Preview {
//    ContentView()
//        .environmentObject(ViewModel())
//}
