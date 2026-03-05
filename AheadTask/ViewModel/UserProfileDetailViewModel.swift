//
//  UserProfileDetailViewModel.swift
//  AheadTask
//
//  Created by Abdul Aleem on 05/03/26.
//

import Foundation

final class UserProfileDetailViewModel: ObservableObject {
    
    @Published var userDetail: [UserProfileDetailModel] = []
    
    func getUserrDetail() {
        userDetail  =  UserProfileDetailModel.getUserProfileDetailData()
    }
    
}
