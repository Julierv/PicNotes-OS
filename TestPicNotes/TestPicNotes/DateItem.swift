//
//  DateItem.swift
//  TestPicNotes
//
//  Created by Jose Pearldrought on 5/1/22.
//

import Foundation
import SwiftUI

class DateItem: Identifiable {
    var date:String
    var images:[UIImage]
    var compare:Int
    
    init() {
        self.date = getCurrentDate()
        self.images = []
        self.compare = getDateComparator()
    }
    
    init(image: UIImage){
        self.date = getCurrentDate()
        self.images = [image]
        self.compare = getDateComparator()
    }
}

func getCurrentDate() -> String{
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    
    let stringDate = "\(day)/\(month)/\(year)"
    return stringDate
}

func getDateComparator() -> Int{
    let date = Date()
    let calendar = Calendar.current
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    
    let res = Int(day) + Int(month) * 30 + Int(year) * 365
    
    return res
}


