//
//  FretView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 29/09/23.
//

import SwiftUI

struct FretView: View {
    @State var pageIndex = 0
    private let page: [Int] = [0,1,2,3]
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        StageFretView(page: 1)
    }
}

#Preview {
    FretView()
}
