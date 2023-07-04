//
//  ContentView.swift
//  DayCounter
//
//  Created by Biagio Raucci on 02/07/2023.
//

import SwiftUI
struct ContentView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var daysBetweenDates = ""

    var body: some View {
        VStack {
            Text("Date Difference")
                .font(.largeTitle)
                .padding(.bottom, 1)
            
            Text("by Biagio Raucci")
                            .font(.caption)
                            .padding(.bottom, 40)
            
            HStack {
                 Text("Start Date")
                 DatePicker("", selection: $startDate, displayedComponents: .date)
             }
             .padding(.horizontal, 80)
             
             HStack {
                 Text("End Date")
                 DatePicker("", selection: $endDate, displayedComponents: .date)
             }
             .padding(.horizontal, 80)
            Button(action: calculateDays) {
                Text("Calculate days between dates")
            }
            .padding(.top, 20)
            Text(daysBetweenDates)
                .padding(.top, 20)
        }
    }
    
    func calculateDays() {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: startDate)
        let date2 = calendar.startOfDay(for: endDate)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        if let days = components.day {
            daysBetweenDates = "There are \(abs(days)) days between the two dates."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
