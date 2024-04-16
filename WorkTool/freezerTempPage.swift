//
//  freezerTempPage.swift
//  WorkTool
//
//  Created by Louis on 04/04/2024.
//

import SwiftUI

struct freezerTempPage: View {
    
    @StateObject var freezerViewModel:FreezerViewModel = FreezerViewModel()
    @Binding var path:NavigationPath
    @State private var isCopied:Bool = false
    @FocusState var isInputActive: Bool
    
    var body: some View {
        
        VStack() {
            navigationBar(pageTitle: "Freezer Temp", isHome: false, path: $path)
            ScrollView{
                
                //not sure why must have to use this kind of foreach, that is not work if use
                //Foreach(freezerViewModel.freezers) {freezer in }
                ForEach(freezerViewModel.freezers.indices,id: \.self) { i in
                    freezerView(freezer: self.$freezerViewModel.freezers[i],isInputActive: $isInputActive)
                }
                
                Button {
                    
                    copyToPasteboard(string: freezerViewModel.getAllTemp())
                    isCopied=true
                    
                    freezerViewModel.reset()
                    
                    
                    
                } label: {
                    CustomButton(name: "Submit")
//                    Text("Submit")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(.blue)
//                        .cornerRadius(20)
//                        .padding(.horizontal, 10)
                    
                    
                }
                .alert(isPresented: $isCopied) {
                    Alert(title: Text("Copied!"), message: nil, dismissButton: .default(Text("OK")))
                }
                
                ForEach(freezerViewModel.freezers) { freezer in
                    Text("\(freezer.name) \(freezer.temp)")
                }
                
                
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        isInputActive = false
                    }
                }
            }

            Spacer()
        }
        .toolbar(.hidden)
//        .onTapGesture {
//            self.endEditing()
//        }
//        .navigationBarBackButtonHidden(true)
    }
//    private func endEditing() {
//        UIApplication.shared.endEditing()
//    }
    
    private func copyToPasteboard(string: String) {
            UIPasteboard.general.string = string
    }

}


//extension UIApplication {
//    func endEditing() {
//        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}

struct freezerView : View{
    
    @Binding var freezer:Freezer
    
//    @Binding var isInputActive: Bool
//    @FocusState private var isFirstResponder: Bool
    var isInputActive: FocusState<Bool>.Binding
    
    var body: some View{
        HStack{
            Text(freezer.name)
                .padding(.leading, 10)
                .frame(minWidth: 100,alignment: .leading)
            Spacer()
            TextField("Tempeture Here...", text: $freezer.temp)
                .keyboardType(.decimalPad)
                .foregroundColor(.black)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .focused(isInputActive)
                
            Button("Def") {
                if freezer.temp.isEmpty {
                    freezer.temp = "Def"
                }else{
                    freezer.temp = freezer.temp + "(Def)"
                }
            }
            .tint(.black)
            .padding()
            .background(Color.gray.cornerRadius(10))
            Spacer()
        }
    }
}

struct freezerTempPage_Previews: PreviewProvider {
    static var previews: some View {
        @State var path = NavigationPath()
        
        
        freezerTempPage(path: $path)
    }
}
