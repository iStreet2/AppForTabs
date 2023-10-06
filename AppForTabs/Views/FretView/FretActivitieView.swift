//
//  FretActivitieView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 04/10/23.
//

import SwiftUI

struct FretActivitieView: View {
    
    @Binding var frets: [Bool]
    @EnvironmentObject var vm: ViewModel
    var fret: Int
    @Binding var sheetView: Bool
    @Binding var attempts: Int
    
    var body: some View {
        
        
        VStack{
            HStack{
                Text("Toque na")
                Text("\(fret)ª CASA")
                    .foregroundStyle(.accent)
            }
            .font(
                Font.custom("Sofia Sans", size: 24)
                    .weight(.heavy)
            )
            .multilineTextAlignment(.center)
            Spacer()
            ZStack{
                Image("GuitarArm")
                    .resizable()
                    .scaledToFit()
                    .frame(width:390)
                HStack(spacing: 0){
                    
                    ForEach(0 ..< vm.retangulosCasas.count, id: \.self){ i in
                        Button {
                            if i == vm.retangulosCasas.count-fret{
                                frets[vm.retangulosCasas.count - i - 1].toggle()
                                sheetView.toggle()
                            }
                            else{
                                withAnimation(.default){
                                    self.attempts += 1
                                    simpleSuccess()
                                }
                            }
                        } label: {
                            if frets[vm.retangulosCasas.count - i - 1]{
                                ZStack{
                                    Rectangle()
                                        .foregroundStyle(.clear)
                                        .background(Color("Rectangle\(vm.retangulosCasas.count - i)"))
                                        .cornerRadius(10)
                                    Text("\(vm.retangulosCasas.count - i)")
                                        .font(.custom("SofiaSans-Regular", size:30))
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                            }
                            else{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .background(.clear)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(width: 59, height: 100)
                        .padding(.horizontal,4)
                    }
                    
                }
                .padding(.trailing,13)
                .padding(.bottom,20)
            }
            Spacer()
        }
    }
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

}

//#Preview {
//    FretActivitieView()
//}
