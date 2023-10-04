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
    @Environment(\.dismiss) var dismiss
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(text1: String, text2: String, context: NSManagedObjectContext, seeAgain: SeeAgain) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
        self.text1 = text1
        self.text2 = text2
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
                    if seeAgain.fretActivitie > 2 && seeAgain.fretActivitie < 7{
                        dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                            seeAgain.fretActivitie+=1
                        }
                        
                    }
                    else{
                        withAnimation(.easeInOut){
                            dismiss()
                            seeAgain.fretActivitie+=1
                        }
                    }
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
