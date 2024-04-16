//
//  ClockInView.swift
//  WorkTool
//
//  Created by Louis on 07/04/2024.
//

import SwiftUI

struct ClockInView: View {
    
    @Binding var selectedTab:Int
    
    let startDateComponents = DateComponents(hour: 7, minute: 30)
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var today:Date = Date()
    @State private var todayTime:Date = Date()
    @State private var lunchBreak: Bool = false
    
    @Environment(\.modelContext) private var context
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(selectedTab:Binding<Int>){
        
        _selectedTab = selectedTab
        
        _startTime = State(initialValue: Calendar.current.date(from: startDateComponents) ?? Date())
        
        _endTime = State(initialValue: calculateFinishTime())
        
    }
        
        var body: some View {
            VStack(spacing:20) {
                HStack{

                    DatePicker("date", selection: $today, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden() // Optionally hide the label
                        
                    
                    Spacer()
                    Text(DateUtil().formatDate(date: todayTime, format: "hh:mm"))
                        .fontWeight(.bold)
                        .onReceive(timer) { input in
                            todayTime = input
                        }
                    
                }
                Spacer()
                
                //first date picker
                generateDatePicker(name: "Start time", date: $startTime)
                    
                
                
                //second date picker
                generateDatePicker(name: "End time", date: $endTime)
                    .padding(.top,50)
                
                
                Spacer()
                
                Toggle(isOn: $lunchBreak, label: {
                    Text("With lunch")
                })
                .frame(width: 150)
//                .padding(.bottom)
                
                Button(action: {
                    submitClockIn(date: today, clockInTime: startTime, clockOutTime: endTime, lunchBreak: lunchBreak)
                }, label: {
                    CustomButton(name: "Submit")
                })
                
                
                
                
            }
//            .frame(maxHeight: .infinity)
//            .ignoresSafeArea()
//            .background(Color.red)
        }
}

struct ClockInView_Previews:
    PreviewProvider {
    static var previews: some View {
        
    @State var selectedTab:Int = 0
        
        ClockInView(selectedTab: $selectedTab)
    }
}


//#Preview {
//    var st:Int = 0
//    ClockInView(selectedTab: $st)
//}
// MARK: Content View
extension ClockInView{
    
    func generateDatePicker(name:String,date:Binding<Date>)->some View{
        
        
        return DatePicker(name, selection: date, displayedComponents: .hourAndMinute)
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden() // Optionally hide the label
            .background(
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(
                        color: Color.black.opacity(0.3),
                        radius: 10,
                        x: 0.0,y: 10
                    )
            )
    }
    
}


// MARK: FUNCTION

extension ClockInView {
    
    
    
    private func calculateFinishTime()->Date{
        let currentDate = Date()
        var currentDateComp = Calendar.current.dateComponents([.hour,.minute], from: currentDate)
        let currentMinute = currentDateComp.minute!
        
        var lastM:Int = Int(String(currentMinute).suffix(1)) ?? 0
        let firstM = currentMinute>=10 ? String(currentMinute).prefix(1) : "0"
        lastM = (lastM > 2 && lastM < 8) ? 5 : 0
        
//        print("======")
//        print(currentMinute)
//        print("first M=\(firstM)")
//        print(lastM)
//        print("======")
        let fullM:String = "\(firstM)\(lastM)"
//        print(fullM)
        
        currentDateComp.minute = Int(fullM)
        return Calendar.current.date(from: currentDateComp) ?? Date()
    }
    
    private func submitClockIn(date:Date , clockInTime:Date, clockOutTime:Date, lunchBreak:Bool){
        
        context.insert(Attendance(date: date, clockInTime: clockInTime, clockOutTime: clockOutTime, lunchBreak: lunchBreak))
        
        do{
            try context.save()
            withAnimation(.spring()){
                selectedTab = 1
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
}
