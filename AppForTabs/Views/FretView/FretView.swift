//
//  FretView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 29/09/23.
//

import SwiftUI
import CoreData

struct FretView: View {

    @Binding var allTrue: Int
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context
    @Binding var frets: [Bool]
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(allTrue: Binding<Int>,frets: Binding<[Bool]>,context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
        self._frets = frets
        self._allTrue = allTrue
    }
    
    var body: some View {
        StageFretView(allTrue: $allTrue, frets: $frets,context: context, seeAgain: seeAgain)
            
        }
            
    
}

//#Preview {
//    FretView()
//}
