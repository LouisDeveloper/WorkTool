//
//  FreezerViewModel.swift
//  WorkTool
//
//  Created by Louis on 04/04/2024.
//

import Foundation

class FreezerViewModel : ObservableObject{
    
    @Published var freezers:[Freezer] = []
    
    init(){
        getFreezers()
    }
    
    public func getFreezers(){
        
        freezers = [
            Freezer(name: "(1) 旧 -", temp: ""),
            Freezer(name: "(2) 鸡 -", temp: ""),
            Freezer(name: "(3) 猪 -", temp: ""),
            Freezer(name: "(4) 牛 -", temp: ""),
            Freezer(name: "(5) 小冷库 -", temp: ""),
            Freezer(name: "(6) 新 1 -", temp: ""),
            Freezer(name: "(7) 新 2 -", temp: "")
        ]
        
    }
    
    public func reset(){
        //this not work I guess is because each for loop are create new freezer( var freezer ..) , so if use the index freezers[index] is direct to use the object in the array.
//        for var freezer in freezers {
//            print("freezer = \(freezer.name) \(freezer.temp)")
//            freezer.temp = ""
//            print("freezer = \(freezer.name) \(freezer.temp)")
//        }
        
        for index in freezers.indices {
            freezers[index].temp = ""
        }
    }
    
    public func getAllTemp()->String{
        var allTemp: String = ""
        for freezer in freezers {
            allTemp = allTemp + freezer.name + freezer.temp + "\n"
        }
        let subString = allTemp.prefix(allTemp.count-1)
        return String(subString)
    }
    
}
