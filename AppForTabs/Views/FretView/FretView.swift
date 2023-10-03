//
//  FretView.swift
//  AppForTabs
//
//  Created by Gabriel Vicentin Negro on 29/09/23.
//

import SwiftUI

struct FretView: View {
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        StageFretView(page: 2)
    }
}

#Preview {
    FretView()
}
