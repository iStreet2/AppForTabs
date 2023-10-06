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
    @Binding var frets: [Bool]
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(frets: Binding<[Bool]>,context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
        self._frets = frets
    }
    
    var body: some View {
        StageFretView(frets: $frets,context: context, seeAgain: seeAgain)
            
        }
            
    
}

//#Preview {
//    FretView()
//}
