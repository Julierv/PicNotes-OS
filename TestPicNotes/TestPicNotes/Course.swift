//
//  Course.swift
//  TestPicNotes
//
//  Created by Jose Pearldrought on 5/2/22.
//

import Foundation

import SwiftUI

class Course: ObservableObject, Identifiable {
    var dateItems:[DateItem] = []
    var name:String
    
    init (name:String){
        self.name = name
    }
    
    func addImage(image:UIImage) {
        var found = false
        var foundID = 0
        let date = getCurrentDate()
        
        for i in 0..<dateItems.count {
            if date == dateItems[i].date{
                found = true
                foundID = i
            }
        }
        
        if found {
            dateItems[foundID].images.append(image)
        } else{
            let newItem = DateItem(image:image)
            dateItems.append(newItem)
        }
        
        // sorted by date
        dateItems = dateItems.sorted(by: {$0.compare > $1.compare})
    }
}
