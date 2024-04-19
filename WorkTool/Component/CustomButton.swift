//
//  CustomButton.swift
//  WorkTool
//
//  Created by Louis on 08/04/2024.
//

import SwiftUI

struct CustomButton: View {
    let name:String
    var infinityMaxWidth:Bool = true
    
    init(name: String, infinityMaxWidth: Bool) {
        self.name = name
        self.infinityMaxWidth = infinityMaxWidth
    }
    
    init(name:String){
        self.name = name
        self.infinityMaxWidth = true
    }
    
    var body: some View {
        Text(name)
            .font(.headline)
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: infinityMaxWidth ? .infinity : nil)
            .background(Color.black)
            .cornerRadius(5)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,y: 5)
            
    }
    
}

#Preview {
    CustomButton(name: "Submit")
}
