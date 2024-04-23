//
//  ContentView.swift
//  WorkTool
//
//  Created by Louis on 04/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    
    let columns : [GridItem] = [
        GridItem(.flexible(), spacing: 30, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        
    ]
    
    let menuItemList : [mainMenuItem] = [mainMenuItem.timeTable,mainMenuItem.freezerTemp,mainMenuItem.ItemLocation,mainMenuItem.comingSoon]
    
    enum mainMenuItem {
        case timeTable
        case freezerTemp
        case ItemLocation
        case comingSoon
        
        var getIcon : String{
            
            switch self{
            case .timeTable:
                return "calendar"
            case .freezerTemp:
                return "thermometer.snowflake"
            case .ItemLocation:
                return "pin"
            case .comingSoon:
                return "timer.circle"
                
            }
        }
        
        var getTitle : String{
            switch self{
            case .timeTable:
                return "Attandance"
            case .freezerTemp:
                return "Freezer Temperature"
            case .ItemLocation:
                return "Item Location"
            case .comingSoon:
                return "Coming Soon..."
                
            }
        }
        
        var isDisable : Bool {
            switch self{
            case .ItemLocation:
                return false
            case .freezerTemp:
                return false
            case .timeTable:
                return false
            case .comingSoon:
                return true
            }
        }
    }
    
    @State var path = NavigationPath()
    
    var body: some View {
        
//        ContentView().preferredColorScheme(.light)
//        middleContent
        
        NavigationStack(path:$path){
            VStack(){
                navigationBar(pageTitle: "Home", isHome: true,path: $path)
                
                    LazyVGrid(columns: columns,spacing: 30) {
                        
                        ForEach(menuItemList,id: \.self ){element in
                            
                            NavigationLink(value: element) {
                                VStack(alignment: .center){
                                    Image(systemName: "\(element.getIcon)")
                                        .font(.system(size: 40))
                                        .padding(.bottom,3)
                                        .foregroundColor(.red)
                                    Text("\(element.getTitle)")
                                        .font(.body)
                                        .fontWeight(.semibold)
                                    
                                }
                                .frame(maxWidth: 150,minHeight:150)
                                .multilineTextAlignment(.center)
                                .background(
                                    Color.white
                                        .shadow(
                                            color: Color.black.opacity(0.3),
                                            radius: 10,
                                            x: 0.0,y: 0
                                        )
                                )

                                .tint(.black)
                            }
                            .disabled(element.isDisable)
                            .background(Color.yellow)

                        }
                        
                    }
                    .padding()
//                    .background(.blue)
                Spacer()
            }
            .navigationDestination(for: mainMenuItem.self) { menuItem in
                if menuItem == mainMenuItem.freezerTemp{
                    freezerTempPage(path:$path)
                }else if menuItem == mainMenuItem.timeTable{
                    AttendancePage(path: $path)
                }else if menuItem == mainMenuItem.ItemLocation{
                    ItemLocationMainPage(path: $path)
                }
            }
            
        }
        

    }

    
    

}

#Preview {
    ContentView()
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

extension Date {

    var printCurrentDate : String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"

        return dateFormatter.string(from: self)

    }
}
