//
//  ProfileViewModel.swift
//  FollowApp
//
//  Created by Vinicius Cabral on 30/12/22.
//

import Foundation

//MARK: - VIEWMODEL

class ProfileViewModel: ObservableObject{
    
    @Published var isFollowing = false //vide botão follow da view
    @Published var userFollowers = String()
    
    var user = User(picture: "Juju",
                    name: "Maria Judyth",
                    nick: "@Cadelinhachata",
                    followers: 22654)
    
    init(){
        loadFollowers()
    }
    
    func loadFollowers(){
        self.userFollowers = customizeNumber(value: user.followers)
    }
    
    
    func customizeNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }
    
    
    
    func followToogle(){
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
    
}
