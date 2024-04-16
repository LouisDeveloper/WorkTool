//
//  navigationBar.swift
//  WorkTool
//
//  Created by Louis on 04/04/2024.
//

import SwiftUI


struct navigationBar: View {
    
    let pageTitle:String
    let isHome:Bool
    @Binding var path:NavigationPath
    
    var body: some View {
        ZStack{
//            Color(uiColor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1))
            Color.red
            .ignoresSafeArea()
            HStack(spacing:nil){
                if !isHome {
                    Image(systemName:"arrow.left").foregroundColor(.white)
                        .onTapGesture {
//                            print("path count=\(path.count)")
                            path.removeLast(1)
//                            print("tab arrow left")
                        }
                    
                }else{
                    Image(systemName:"house.fill").foregroundColor(.white)
                }
                Spacer()
                Text(pageTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading,10)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName:"gear").foregroundColor(.white)
            }
            .font(.title)
            //.background(Color.blue)
            .padding(.horizontal)
        }
        .frame(maxHeight: UIScreen.main.bounds.size.height * 0.07)
//        .shadow(color: .red.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
        
        

            
            
            
       
        
    }
}

struct navigationBar_Previews: PreviewProvider {
    static var previews: some View {
        
        @State var path = NavigationPath()
        
        navigationBar(pageTitle: "aaa",isHome: true,path: $path)
    }
}
