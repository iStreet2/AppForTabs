//
//  DraggableItem.swift
//  AppForTabs
//
//  Created by Beatriz Andreucci on 02/10/23.
//

import Foundation

struct DraggableItem: Hashable{
    let uuid = UUID()
    var origin: RectanglesModel
    var destination: RectanglesModel

    
}
