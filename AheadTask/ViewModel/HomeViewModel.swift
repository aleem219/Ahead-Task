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
    
    func getUsers() {
        stories  =  StoryUser.getMockData()
    }
    
    func getPost() {
        posts = PostModel.getMockData()
    }
}
