//
//  FretView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 29/09/23.
//

import SwiftUI
import CoreData

struct FretView: View {

    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
    }
    
    var body: some View {
        StageFretView(context: context, seeAgain: seeAgain)
            
        }
            
    
}

//#Preview {
//    FretView()
//}
