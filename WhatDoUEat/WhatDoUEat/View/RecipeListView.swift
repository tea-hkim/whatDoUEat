//
//  RecipeListView.swift
//  WhatDoUEat
//
//  Created by 김태호 on 2022/08/31.
//

import SwiftUI

struct RecipeListView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var vegetableName: String
    let dummyData: [String] = ["가지", "호박","가지", "호박","가지", "호박","가지", "호박","가지", "호박","가지", "호박","가지", "호박","가지", "호박","가지", "호박",]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 25, weight: .bold))
                            .padding(.bottom, 5)
                            .tint(.black)
                    })
                    Spacer()
                }// HStack_BackButton
                
                RecipeListTitle(ingredient: vegetableName)
                
                ZStack {
                    List {
                        ForEach ( dummyData, id: \.self) {
                            RecipeBox(recipeName: $0)
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                    }
                    .padding(0)
                    .listStyle(.plain)
                    VStack {
                        Spacer()
                        Button {
                            print("리셋 버튼")
                        } label: {
                            RoundedRectangle(cornerRadius : 15)
                                .stroke(.black, lineWidth: 3)
                                .background(
                                    RoundedRectangle(cornerRadius : 15)
                                        .fill(Color.buttonYello)
                                )
                                .frame(height: 63)
                                .overlay(
                                    Text("이미지 추가하기")
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundColor(.black)
                                )
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        .padding(.horizontal, 30)
        }
    }
}


struct RecipeListTitle: View {
    var ingredient: String
    var body: some View {
        HStack {
            Text(ingredient + " ")
                .font(.system(size: 44, weight: .bold))
                .foregroundColor(.blue)
            + Text("로 해먹자")
                .font(.system(size: 32, weight: .bold))
            Spacer()
        }
    }
}

struct RecipeBox: View {
    var recipeName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.lightYellow)
            HStack {
                Image(systemName: "fork.knife.circle.fill")
                    .font(.system(size: 70))
                    .padding(18)
                Text(recipeName)
                    .font(.system(size: 20, weight: .bold))
                Spacer()
            }
        }
        .padding(.bottom, 20)
    }
}
