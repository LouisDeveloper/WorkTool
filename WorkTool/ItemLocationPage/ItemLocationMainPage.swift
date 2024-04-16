//
//  ItemLocationMainPage.swift
//  WorkTool
//
//  Created by Louis on 08/04/2024.
//

import SwiftUI

struct ItemLocationMainPage: View {
    
    @Binding var path:NavigationPath
    
    var body: some View {
        VStack{
            navigationBar(pageTitle: "Item Location", isHome: false, path: $path)
            
            Spacer()
            Image(systemName: "timer.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("Coming soon...")
                .font(.title)
            
            Spacer()
            
            
        }
        .toolbar(.hidden)
    }
}

#Preview {
    ItemLocationMainPage(path: .constant(NavigationPath()))
}
