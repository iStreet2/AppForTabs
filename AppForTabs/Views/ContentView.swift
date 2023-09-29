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
    @State var tutorialViewAgain = false
    
    //Coisa do CoreData
    @ObservedObject var tutorialController: TutorialController
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var tutorial: FetchedResults<Tutorial>
    
    init(context: NSManagedObjectContext) {
        self.tutorialController = TutorialController(context: context)
    }
    
    var body: some View {
        if homeView == false{
            if tutorial[0].enabled != false {
                TutorialView(homeView: $homeView, context: context, tutorial: tutorial[0])
            }
            else{
                HomeView(homeView: $homeView, tutorialViewAgain: $tutorialViewAgain, context: context, tutorial: tutorial[0])
            }
        }
        else{
            HomeView(homeView: $homeView, tutorialViewAgain: $tutorialViewAgain, context: context, tutorial: tutorial[0])
                .transition(.push(from: Edge.trailing))
        }
        
    }
}

//#Preview {
//    ContentView()
//        .environmentObject(ViewModel())
//}
