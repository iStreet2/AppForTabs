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

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

struct DropViewDelegate: DropDelegate{
    
    @Binding var draggedItem: DraggableItem?
    @Binding var destinationItem: DraggableItem
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
        
    }
    
    func performDrop(info: DropInfo) -> Bool {
        
        if destinationItem.destination == draggedItem?.destination{
            destinationItem.destination.color = draggedItem?.origin.color ?? .black
            destinationItem.destination.numero = draggedItem?.origin.numero ?? " "
            withAnimation(.easeInOut){
                destinationItem.origin.color = Color("Background")
                destinationItem.origin.numero = ""
            }
            
            
        }
        draggedItem = nil
        return true
    }
    
     
}


//#Preview {
//    ContentView()
//        .environmentObject(ViewModel())
//}
