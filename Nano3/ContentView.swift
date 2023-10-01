//
//  ContentView.swift
//  Nano3
//
//  Created by Lucas Flores on 26/09/23.
//

import SwiftUI
import Vision
import CoreML
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var recognizedTexts = [String] ()
    @State private var isLoading = true
    @State private var image: UIImage? = UIImage(systemName: "camera")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.species),
    ]) var birds: FetchedResults<BirdRecord>
    
    
    
    var body: some View {
        AllBirdSightingsView()
            .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
