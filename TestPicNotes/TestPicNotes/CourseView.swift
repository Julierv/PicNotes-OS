//
//  Course.swift
//  TestPicNotes
//
//  Created by Jose Pearldrought on 5/1/22.
//

import Foundation
import SwiftUI

struct CourseView: View {
    
    var data:[DateItem]
    
    var body: some View {
        ForEach(0..<data.count) { i in
            VStack{
                HStack{
                    Text(data[i].date)
                        .bold()
                        .padding()
                    Spacer()
                }
                GeometryReader { geo in
                    ForEach(0..<data[i].images.count) { indx in
                        Image(uiImage: data[i].images[indx])
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.3)
                    }
                }
            }
        }
    }
}

struct Course_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(data: [DateItem()])
            .previewInterfaceOrientation(.portrait)
    }
}


/*
ForEach(0..<dataItem.count){ ind in
    
    VStack {
        
        HStack{
            Text(dataItem[ind].date)
                .bold()
                .padding()
            Spacer()
        }
        GeometryReader { geo in
            ForEach(0..<dataItem[ind].images.count) { indx in
                dataItem[ind].images[indx].image
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.3)
            }
            
        }
        
    }
    
}
*/
