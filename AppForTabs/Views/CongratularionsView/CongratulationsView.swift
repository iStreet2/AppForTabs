//
//  CongratulationsView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 05/10/23.
//

import SwiftUI
import CoreData

struct CongratulationsView: View {
    @Environment(\.dismiss) var dismiss
    @State var sheetView = true
    @EnvironmentObject var vm: ViewModel
    var type: String
    
    //Coisas do CoreData
    @Environment(\.managedObjectContext) var context
    
    var seeAgain: SeeAgain //Só recebendo 1, e nao o vetor como no FetchRequest
    @ObservedObject var seeAgainController: SeeAgainController
    
    init(context: NSManagedObjectContext, seeAgain: SeeAgain, type: String) {
        self.seeAgainController = SeeAgainController(context: context)
        self.seeAgain = seeAgain
        self.type = type
    }
    
    
    var body: some View {
        ZStack{
            Color("BackgroundBlue")
                .ignoresSafeArea()
            VStack{
                Image("stars")
                Text("PARABÉNS!")
                  .font(
                    Font.custom("Sofia Sans", size: 40)
                      .weight(.heavy)
                  )
                  .foregroundColor(Color("Rectangle3"))
                Text("Você completou todas as atividades")
                    .bold()
                  .font(Font.system(size: 18))
                  .foregroundColor(.white)
                ZStack{
                    Image("TabsyCongratulations")
                }
                Spacer()
            }
            
        }
        .padding(.top,20)
        .ignoresSafeArea()
        .sheet(isPresented: $sheetView, content: {
            VStack{
                Button(action: {
                    if type == "String"{
                        seeAgainController.resetStagesString(seeAgain: seeAgain) //Resetar a fase das cordas
                        vm.resetRetangulos()
                    }else{
                        seeAgainController.resetStagesFret(seeAgain: seeAgain) //Resetar a fase das casas
                        vm.resetRetangulosCasas()
                    }
                    dismiss()
                }, label: {
                    VStack{
                        Image("PlayAgain")
                        Text("Jogar novamente")
                          .font(
                            Font.custom("Sofia Sans", size: 24)
                              .weight(.bold)
                          )
                          .foregroundColor(Color("StrongOrange"))
                    }
                    
                })
                Button(action: {
                    dismiss()
                }, label: {
                    VStack{
                        Image("Home")
                        Text("Início")
                          .font(
                            Font.custom("Sofia Sans", size: 24)
                              .weight(.bold)
                          )
                          .foregroundColor(Color("StrongOrange"))
                    }
                })
            }
            .presentationDetents([.fraction(0.45),.large])
            .presentationDragIndicator(.hidden)
            .interactiveDismissDisabled()
            .presentationBackgroundInteraction(
                .enabled(upThrough: .fraction(0.45)))
        })
        
    }
}

//#Preview {
//    CongratulationsView()
//}
