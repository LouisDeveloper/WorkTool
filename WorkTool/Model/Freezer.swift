//
//  Freezer.swift
//  WorkTool
//
//  Created by Louis on 04/04/2024.
//

import Foundation

struct Freezer : Identifiable{
    
    let id:String = UUID().uuidString
    var name:String
    var temp:String
}
