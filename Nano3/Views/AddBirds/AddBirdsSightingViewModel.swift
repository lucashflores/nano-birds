//
//  BirdsViewModel.swift
//  Nano3
//
//  Created by Lucas Flores on 28/09/23.
//

import Foundation
import SwiftUI
import CoreData

class AddBirdsSightingViewModel: ObservableObject {
    @Environment(\.managedObjectContext) private var moc
    @ObservedObject private var imageClassifier = ImageClassifier()
    @Published var currentBirdSpecies: String = ""
    
    public func saveBird(moc: NSManagedObjectContext, note: String, image: UIImage?) {
        let newBirdRecord = BirdRecord(context: moc)
        newBirdRecord.id = UUID()
        newBirdRecord.species = self.currentBirdSpecies.capitalized
        newBirdRecord.note = note
        newBirdRecord.timestamp = Date()
        newBirdRecord.image = image?.jpeg(.medium)
        
        try? moc.save()
    }
    
    public func classifyImage(_ image: UIImage) {
        imageClassifier.classifyImage(image)
        self.currentBirdSpecies = self.imageClassifier.prediction
    }
    
}
