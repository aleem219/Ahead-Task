//
//  HomeViewModel.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import Foundation


final class HomeViewModel:ObservableObject {
    
    @Published var stories: [StoryUser] = []
    @Published var posts: [PostModel] = []
    
    init() {
           getUsers()
           getPost()
       }
    
    private func getUsers() {
        stories  =  StoryUser.getMockData()
    }
    
    private  func getPost() {
        posts = PostModel.getMockData()
    }
}
