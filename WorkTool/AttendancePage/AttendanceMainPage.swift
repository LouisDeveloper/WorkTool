//
//  AttendancePage.swift
//  WorkTool
//
//  Created by Louis on 05/04/2024.
//

import SwiftUI

struct AttendancePage: View {
    
    @Binding var path:NavigationPath
    
    var body: some View {
        VStack{
            navigationBar(pageTitle: "Attendance", isHome: false, path: $path)
            
            Spacer()
        }
    }
}

struct AttendancePage_Preview:PreviewProvider{
    static var previews: some View {
        @State var path = NavigationPath()
        
        
        AttendancePage(path: $path)    }
}

//#Preview {
//    @State var path = NavigationPath()
//    
//    
//}
