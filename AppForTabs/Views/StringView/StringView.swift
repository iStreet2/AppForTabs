//
//  StringView.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 03/10/23.
//

import SwiftUI
import CoreData

struct StringView: View {
    @Environment(\.managedObjectContext) var context //Data Controller
    @State var page = 1
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
    }
    
    var body: some View {
        StageStringView( page: $page , context: context, seeAgain: seeAgain)
    }
    
//    func resetRectangles(){
//        ForEach(0 ..< vm.retangulosCasas.count, id: \.self){ i in
//            vm.retangulosCasas[i].origin.color = Color("Rectangle1")
//        }
//    }
}

//#Preview {
//    StringView(page: State <Int>, context: NSManagedObjectContext, seeAgain: SeeAgain)
//}
