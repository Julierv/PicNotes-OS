//
//  PhotoPicker.swift
//  TestPicNotes
//
//  Created by Jose Pearldrought on 5/1/22.
//


import SwiftUI

struct PhotoPicker: View {
    @State var showPicturePicker = false
    @State var showActionSheet = false
    @State var image:UIImage?
    
    @State var sourceType:UIImagePickerController.SourceType = .photoLibrary
    
    
    var body: some View {
        VStack{
            Text("Add Photo").font(.title).bold()
            Spacer()
            
            if image != nil {
                Image(uiImage: image!)
                .resizable()
                .scaledToFill()
                    .frame(width:320, height:300)
                Spacer()
                Button {
                    image = nil
                } label: {
                    Image(systemName: "square.and.arrow.down")
                        .foregroundColor(Color(.label))
                    Text("Press To Save Image").foregroundColor(Color(.label))
                }
                Spacer()
                Button {
                    image = nil
                } label: {
                    Text("Cancel").foregroundColor(Color(.red))
                }
                
            } else {
                Button {
                    self.showActionSheet = true
                } label: {
                    Image(systemName: "rectangle.stack.badge.plus")
                        .foregroundColor(Color(.label))
                    Text("Add").foregroundColor(Color(.label))
                }.actionSheet(isPresented: $showActionSheet){
                    ActionSheet(title: Text("Photo From:"), message: nil, buttons: [
                        
                        .default(Text("Camera"), action: {
                            self.sourceType = .camera
                            self.showPicturePicker = true
                        }),
                        .default(Text("Phone Gallery"), action: {
                            self.sourceType = .photoLibrary
                            self.showPicturePicker = true
                        }),
                        
                        .cancel()
                        
                    ])
                }.sheet(isPresented: $showPicturePicker){
                    imagePicker(showPicturePicker: self.$showPicturePicker, image: self.$image, sourceType: self.sourceType)
                }
            }
            Spacer()
        }
        
        
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
            
    }
}
