//
//  AddBirdsView.swift
//  Nano3
//
//  Created by Lucas Flores on 29/09/23.
//

import Foundation
import SwiftUI

struct AddBirdsSightingView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = AddBirdsSightingViewModel()
    @State var image: UIImage?
    @State var note = ""
    @State var species = "species"
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                VStack {
                    if (image == nil) {
                        VStack(spacing: 30) {
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                                .font(.system(size: 30))
                            Text("Tap to add the bird picture")
                                .fontWeight(.bold)
                                .font(.headline)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(height: 250)
                    }
                    else {
                        Image(uiImage: image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 250)
                            .clipShape(Rectangle())
                    }
                }
                .onTapGesture { self.shouldPresentActionScheet = true }
                    .sheet(isPresented: $shouldPresentImagePicker) {
                        SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                    }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                        ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = true
                        }), ActionSheet.Button.default(Text("Photo Library"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = false
                        }), ActionSheet.Button.cancel()])
                    }
                    .padding(.top, 25)
                
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Note")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        TextField("Add a note about this sighting", text: $note, axis: .vertical)
                    }
                    
                    Divider()
                        
                    
                    VStack(alignment: .leading, spacing: 10) {
                        if (!self.viewModel.currentBirdSpecies.isEmpty) {
                            HStack(alignment: .center) {
                                Image(systemName: "bird.fill")
                                
                                Text(self.viewModel.currentBirdSpecies.capitalized)
                                .foregroundColor(.white)
                                
                            }
                        }
                        
                        
                        HStack(alignment: .center) {
                            
                            Image(systemName: "calendar")
                            
                            Text("\(DateUtils.getMonth()) \(DateUtils.getDay()), \(DateUtils.getYear())")
                        }
                    }.onChange(of: self.image ?? UIImage(systemName: "camera")!) { image in
                        self.viewModel.classifyImage(image)
                    }
                    
                    
                }.padding(.horizontal, 25)
                
                
                Spacer()
                    
                    
            }
            .navigationTitle("Add Sighting")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        self.viewModel.saveBird(moc: moc, note: note, image: image)
                        dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    AddBirdsSightingView()
        .preferredColorScheme(.dark)
}
