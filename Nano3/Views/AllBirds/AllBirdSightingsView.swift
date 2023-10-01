//
//  BirdsView.swift
//  Nano3
//
//  Created by Lucas Flores on 28/09/23.
//

import SwiftUI
import Vision

struct AllBirdSightingsView: View {
    @State private var isFormSheetPresented = false
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.species),
    ]) var birds: FetchedResults<BirdRecord>
    let columns = [GridItem(.adaptive(minimum: 160))]
    
    var body: some View {
        NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(birds, id: \.self) { bird in
                            NavigationLink {
                                BirdSightingDetailsView(image: UIImage(data: bird.image!)!, note: bird.note!, species: bird.species!, date: bird.timestamp!)
                            } label: {
                                if let image = bird.image {
                                    Image(uiImage: UIImage(data: image)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipShape(Rectangle())
                                } else {
                                    Image(systemName: "x")
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("Birds")
                .toolbar {
                    Button {
                        isFormSheetPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $isFormSheetPresented, content: {
                        AddBirdsSightingView()
                            .preferredColorScheme(.dark)
                    })
                }
            }
    }
}


#Preview {
    AllBirdSightingsView()
}
