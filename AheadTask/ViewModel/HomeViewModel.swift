//
//  HomeViewModel.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import Foundation

@Observable
final class HomeViewModel {
    
     var stories: [StoryUser] = []
     var posts: [PostModel] = []
    
    func getUsers() {
        stories  =  StoryUser.getMockData()
    }
    
    func getPost() {
        posts = PostModel.getMockData()
    }
}
