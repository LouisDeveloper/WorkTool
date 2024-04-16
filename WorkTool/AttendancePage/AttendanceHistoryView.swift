//
//  AttendanceHistoryView.swift
//  WorkTool
//
//  Created by Louis on 07/04/2024.
//

import SwiftUI
import SwiftData

struct AttendanceHistoryView: View {
    
    
//    @StateObject private var attendanceVieModel:AttendanceViewModel = AttendanceViewModel()
    @Query(sort: \Attendance.date,order: .reverse) var attendances:[Attendance]
    
//    var attendances:[Attendance] = [Attendance(date: Date(), clockInTime: Date(), clockOutTime: Date(), lunchBreak: true),Attendance(date: Date(), clockInTime: Date(), clockOutTime: Date(), lunchBreak: false)]
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
        List{
//            ForEach(attendanceVieModel.attendanceList.indices,id: \.self) { i in
//                attendanceSingleView(attendance: self.attendanceVieModel.attendanceList[i])
//            }
            ForEach(attendances){ attendance in
                attendanceSingleView(attendance: attendance)
            }
            .onDelete(perform: doRemove)
        }
        

    }
}

#Preview {
    AttendanceHistoryView()
}

// MARK: CONTENT

extension AttendanceHistoryView{
    
    private func attendanceSingleView(attendance:Attendance)-> some View{
        
        
        
        return HStack(spacing:10){
            VStack(alignment:.center){
                Text("Date:")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
//                Spacer()
                Text("\(DateUtil().formatDate(date: attendance.date, format: "MMM-dd"))")
                    .fontWeight(.bold)
            }
            
            Spacer()
            Spacer()
            VStack(alignment:.leading, spacing:20) {
                VStack(alignment: .leading) {
                    Text("Clock In Time:")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                    
                    Text("\(DateUtil().formatDate(date: attendance.clockInTime, format: "hh-mm aa"))")
                        .fontWeight(.bold)
//                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text("Clock Out Time:")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                    Text("\(DateUtil().formatDate(date: attendance.clockOutTime, format: "hh-mm aa"))")
                        .fontWeight(.bold)
//                    Spacer()
                }
            }
//            .padding(30)
            
            Spacer()
            VStack(alignment: .center , spacing: 10) {
                Text("Lunch Break:")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                Image(systemName: attendance.lunchBreak ? "checkmark" : "xmark" )
                    .foregroundStyle(attendance.lunchBreak ? .green : .red)
                    .fontWeight(.bold)
//                Spacer()
                    
            }
        }
    }
    
}


//MARK: FUNCTION
extension AttendanceHistoryView{
 
    private func doRemove(indexSet:IndexSet){
        indexSet.forEach{ i in
            let attendance = attendances[i]
            context.delete(attendance)
            do{
                try context.save()
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
}
