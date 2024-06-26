//
//  RatingView.swift
//  ComplexAnimation
//
//  Created by Nicola Kaleta on 09/03/2024.
//

import SwiftUI

struct RatingView: View {
    var rating : Int
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .font(.caption)
                    .foregroundStyle(index <= rating ? .yellow : .secondary)
            }
        }
    }
}

#Preview {
    RatingView(rating: 1)
}
