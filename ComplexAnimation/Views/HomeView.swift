//
//  HomeView.swift
//  ComplexAnimation
//
//  Created by Nicola Kaleta on 09/03/2024.
//

import SwiftUI

let tags : [String] = ["History", "Classical", "Biography", "Cartoon", "Adventure", "Fairy", "Fantasy" ]

struct HomeView: View {
    
    @State var activeTag: String = "Biography"
    @Namespace private var animation
    
    @State var showDetail: Bool = false
    @State var selectedBook : Book?
    @State var animateCurrentBook : Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Browse")
                    .font(.largeTitle.bold())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            
            TagsView()
        }
    }
    
    @ViewBuilder
    func TagsView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background {
                            if activeTag == tag {
                                Capsule()
                                    .fill(.blue)
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            } else {
                                Capsule()
                                    .fill(.secondary.opacity(0.2))
                            }
                        }
                        .foregroundStyle(activeTag == tag ? .white : .secondary)
                        .onTapGesture {
                            withAnimation(
                                .interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)
                            ) {
                                activeTag = tag
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}