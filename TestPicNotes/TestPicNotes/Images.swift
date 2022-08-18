//
//  Images.swift
//  TestPicNotes
//
//  Created by Jose Pearldrought on 5/1/22.
//

import Foundation
import SwiftUI

class LoneImage: Identifiable, Codable {
    var id = UUID()
    var name:String
    
    init(name:String){
        self.name = name
    }
}
