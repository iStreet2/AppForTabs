//
//  CongratulationsSheetView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 02/10/23.
//

import SwiftUI
import CoreData

struct CongratulationsSheetView: View {
    var text1: String
    var text2: String
    var type: String
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ViewModel
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(text1: String, text2: String,type: String, context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
        self.text1 = text1
        self.text2 = text2
        self.type = type
    }
    
    var body: some View {
        
        VStack(alignment:.leading){
            Group{
                Text(text1)
                    .font(.system(size:21).weight(.heavy))
                Text(text2)
            }
            .foregroundStyle(.accent)
            .padding()
            HStack{
                Spacer()
                Button(action: {
                    if type == "String"{
                        seeAgainController.saveStageString(seeAgain: seeAgain)
                    }else{
                        if seeAgain.fretActivitie == 3{
                            
                            vm.page3+=1
                            if vm.page3 == 6{
                                seeAgainController.saveStageFret(seeAgain: seeAgain)
                            }
                        }else{
                            seeAgainController.saveStageFret(seeAgain: seeAgain)
                        }
                    }
                    dismiss()
                    
                    
                    
                    
                },label: {
                    Text("Continuar")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 336)
                        .background(.accent)
                        .cornerRadius(24)
                })
                Spacer()
            }
            Spacer()
        }
        .background(Color("OrangeBackground"))
        
        
        
    }
}

//#Preview {
//    CongratulationsSheetView(text1: "Boa!", text2: "O espaço entre dois trastes é chamado de Casa.", page: .constant(1))
//}
