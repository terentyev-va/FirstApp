//
//  Date + Extensions.swift
//  FirstApp
//
//  Created by Вячеслав Терентьев on 01.06.2022.
//

import Foundation

extension Date {
    
    func getWeekdayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
