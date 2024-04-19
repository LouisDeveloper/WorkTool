//
//  RequestReportPage.swift
//  WorkTool
//
//  Created by Louis on 16/04/2024.
//

import SwiftUI

struct RequestReportPage: View {
    
    @State var fromDate:Date = Date()
    @State var toDate:Date = Date()
    
    var body: some View {
        VStack(spacing:20){
            
            Text("Request Generate Report")
                .font(.title2)
                .bold()
                .foregroundStyle(.primary)
            
            HStack(spacing:20){
                DatePicker("From Date:", selection: $fromDate, displayedComponents: [.date])
                Spacer()
                DatePicker("To Date:", selection: $fromDate, displayedComponents: [.date])
            }
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                   Text("Add Extra")
                    
//                    CustomButton(name: "Add Extra" , infinityMaxWidth: false)
                        
                        
                        
                })
                .buttonStyle(BorderedButtonStyle())
                .foregroundStyle(.primary)
                
//                .tint(.black)
                
            }
            
        }
    }
}

#Preview {
    RequestReportPage()
}
