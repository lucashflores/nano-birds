//
//  BirdSightingDetailsView.swift
//  Nano3
//
//  Created by Lucas Flores on 01/10/23.
//

import SwiftUI

struct BirdSightingDetailsView: View {
    var image: UIImage
    var note: String
    var species: String
    var date: Date
    
    var body: some View {
        VStack(alignment: .center) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 250)
                .clipShape(Rectangle())
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Note")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text(note)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .center) {
                        Image(systemName: "bird.fill")
                        
                        Text(species)
                        .foregroundColor(.white)
                        
                    }
                    
                    HStack(alignment: .center) {
                        Image(systemName: "calendar")
                        Text("\(DateUtils.getMonth()) \(DateUtils.getDay()), \(DateUtils.getYear())")
                    }
                }
            }.padding(.horizontal, 25)
            
            Spacer()
        }
        
    }
}

#Preview {
    BirdSightingDetailsView(image: UIImage(systemName: "plus")!, note: "Foi legal tirar foto desse passarinho, ele é muito bonito!", species: "Quetzal", date: Date())
        .preferredColorScheme(.dark)
}
