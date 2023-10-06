//
//  StringView.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 03/10/23.
//

import SwiftUI
import CoreData

struct StringView: View {
    
    
    //CoreData
    @Environment(\.managedObjectContext) var context //Data Controller
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
    }
    
    var body: some View {
        StageStringView(context: context, seeAgain: seeAgain)
    }
    

}

//#Preview {
//    StringView(page: State <Int>, context: NSManagedObjectContext, seeAgain: SeeAgain)
//}
