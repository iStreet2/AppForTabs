//
//  PageExplanationView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 05/10/23.
//

import SwiftUI

struct PageExplanationView: View {
    
    var id = UUID()
    @State var page: Int
    @State var scale = 0.1
    
    var body: some View {
        VStack{
            
            if page == 0{
                Text("ANDRE")
                
            }else if page == 1{
                Text("DA")
            }else if page == 2{
                Text("O CU")
            }
            Spacer()
        }
    }
}

//#Preview {
//    PageExplanationView()
//}
