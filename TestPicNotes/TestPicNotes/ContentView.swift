//
//  ContentView.swift
//  TestPicNotes
//
//  Created by Jose on 2/28/22.
//
import Photos
import PhotosUI
import SwiftUI

let sfNames = ["tray.2.fill", "camera.shutter.button"]

struct ContentView: View {
    @State var courses:[Course] = []
    @State var showActionSheet = false
    @State var showImagePicker = false
    
    @State var selection:String = "Empty, Add Courses"
    @State var courseImputName = ""
    
    @State var sourceType:UIImagePickerController.SourceType = .photoLibrary
    @State var imageI:UIImage?
    @State private var navSelection:String? = nil
    
    @State var secTab = 0
    @State var SecCam = 0
    @State var courseNum:Int = 0
    
    mutating func courseAdd(course: Course){
        courses.append(course)
    }
    
    mutating func imageAdd(image: UIImage, courseName: String){
        for i in 0..<courses.count{
            if courses[i].name == courseName{
                courses[i].addImage(image:image)
            }
        }
    }
    
    var body: some View {
        VStack{
            ZStack{
                switch secTab {
                case 0:
                    
                    VStack{
                        Text("Courses").font(.title).bold()
                        HStack{
                            Button {
                                if courseImputName != ""{
                                    let newCourse = Course(name:courseImputName)
                                    courses.append(newCourse)
                                    courseImputName = ""
                                }
                            } label: {
                                Spacer()
                                Text("Add Course").font(.title2).foregroundColor(Color(.label))
                                    .background(RoundedRectangle(cornerRadius: 4).stroke()).padding()
                                GeometryReader{ geo in
                                    Form{
                                        Section{
                                            TextField("Course Name", text:$courseImputName)
                                        }
                                    }
                                }.scaledToFit()
                            }
                        }
                        NavigationView{
                            ScrollView{
                                VStack{
                                    ForEach(courses, id: \.name) {cou in
                                        VStack{
                                            NavigationLink(destination: CourseView(data:cou.dateItems),
                                                           label:{
                                                Text(cou.name).font(.headline).foregroundColor(Color(.label))
                                                    .background(RoundedRectangle(cornerRadius: 4).stroke())
                                                    .padding()
                                            })
                                        }
                                        
                                    }
                                    
                                }
                            }
                        }.ignoresSafeArea()
                        
                    }
                     
                case 1:
                    VStack{
                        Text("Add Photo").font(.title).bold()
                        Spacer()
                        
                        if imageI != nil {
                            Image(uiImage: imageI!)
                            .resizable()
                            .scaledToFit()
                                .frame(width:320, height:300)
                            Spacer()
                            Picker(selection: $selection) {
                                ForEach(0..<courses.count){ i in
                                    Text("Course Picker: " + courses[i].name)
                                        .tag(courses[i].name)
                                }
                            } label: {
                                Text("picker")
                            }
                            if selection != "Empty, Add Courses"{
                                Button {
                                    for k in 0..<courses.count{
                                        if courses[k].name == selection {
                                            courses[k].addImage(image: imageI!)
                                        }
                                    }
                                    imageI = nil
                                } label: {
                                    Image(systemName: "square.and.arrow.down")
                                        .foregroundColor(Color(.label))
                                    Text("Press To Save Image").foregroundColor(Color(.label))
                                }.onTapGesture {
                                    Alert(title: Text("Saving Successful"),
                                          primaryButton: .cancel(Text("Continue")), secondaryButton: .cancel(Text("Yey!")))
                                }
                                Spacer()
                                Button {
                                    imageI = nil
                                } label: {
                                    Text("Cancel").foregroundColor(Color(.red))
                                }
                            } else{
                                Spacer()
                                Spacer()
                                Text("Note:").foregroundColor(Color(.red)).font(.headline)
                                Text("Select a course to enable saving").foregroundColor(Color(.label))
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
                                    //Button1
                                    .default(Text("Camera"), action: {
                                        self.sourceType = .camera
                                        self.showImagePicker = true
                                    }),
                                    .default(Text("Phone Gallery"), action: {
                                        self.sourceType = .photoLibrary
                                        self.showImagePicker = true
                                    }),
                                    
                                    //Button2
                                    .cancel()
                                    
                                ])
                            }.sheet(isPresented: $showImagePicker){
                                imagePicker(showPicturePicker: self.$showImagePicker, image: self.$imageI, sourceType: self.sourceType)
                            }
                        }
                        Spacer()
                    }
                case 2:
                    VStack{
                        Text("Scheduler").font(.title).bold()
                    }
                    
                default:
                    Text("error")
                    
                }
            }
            Spacer()
            
            HStack{
                ForEach(0..<2){num in
                    Button {
                        secTab = num
                    } label: {
                        Spacer()
                        Image(systemName: sfNames[num])
                            .foregroundColor(Color(.label))
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

extension Color{
    static var ramdom: Color {
        return Color(
                red:   .random(in: 0...1),
                green: .random(in: 0...1),
                blue:  .random(in: 0...1)
                )
        
    }
}
