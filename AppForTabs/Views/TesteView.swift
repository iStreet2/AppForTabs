//
//  TesteView.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 29/09/23.
//

import SwiftUI

struct TesteView: View {
    let sports = ["0" ,"1","2"]
    @State private var dropImage = [Image(systemName: "photo"),Image(systemName: "photo"),Image(systemName: "photo")]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(sports, id: \.self) { sport in
                    Image(sport)
                        .frame(minWidth: 54, minHeight: 54)
                        .cornerRadius(5)
                        .foregroundStyle(.white)
                        .draggable(Image( sport))
                }
            }
            .frame(minWidth: 300, minHeight: 70)
            .background(.gray)
            VStack{
                ForEach(0 ..< dropImage.count, id:\.self){ i in
                        dropImage[i]
                            .frame(width: 50, height: 50)
                            .cornerRadius(5)
                            .background(.gray)
                            .foregroundStyle(.white)
                            .dropDestination(for: Image.self) { items, teste in
                                if Int(sports[i]) == i{
                                    dropImage[i] = items.first ?? Image(systemName: "photo")
                                }
                                else{
                                    print("LUGAR ERRADO!")
                                }
                                return true
                    }
                    
                }
            }
        }
    }
}



#Preview {
    TesteView()
}
