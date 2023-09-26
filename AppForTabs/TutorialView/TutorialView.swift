//
//  tutorialScreen1.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 25/09/23.
//

import SwiftUI

struct tutorialView: View {
    var body: some View {
        VStack{
            VStack{
                Text("ISTO É UMA")
                    .font(.system(size:20))
                    .bold()
                Text("TABLATURA")
                    .font(.system(size:40))
                    .bold()
                    .foregroundColor(.orange)
            }
            .padding(.top)
            Spacer()
        }
    }
}

#Preview {
    tutorialView()
}
