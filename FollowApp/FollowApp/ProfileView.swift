//
//  ProfileView.swift
//  FollowApp
//
//  Created by Vinicius Cabral on 30/12/22.
//

import SwiftUI

//MARK: - VIEW
struct ProfileView: View {
    @EnvironmentObject var viewModel: ProfileViewModel//Source of truth - "Fonte da verdade" -> vai alterar o body da view

    var body: some View {
        
        VStack {
                ProfileDataView()
                ActionView()
            }
        .animation(.easeInOut, value: viewModel.isFollowing)
    }
}
        
struct ProfileDataView: View{
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View{
        //Perfil --
        Image(viewModel.user.picture)
            .resizable()
            .frame(width: 250, height: 250)
            .padding(.bottom, 0)
            .clipShape(RoundedRectangle(cornerRadius: 90))
        
        Text(viewModel.user.name)
            .font(.system(size: 40, weight: .bold))
        
        Text(viewModel.user.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundColor(.gray)
        
        Text(viewModel.userFollowers)
            .font(.system(size: 80, weight: .light))
            .padding(viewModel.isFollowing ? 40 : 25)
    }
}

struct ActionView: View{
    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View{
        //Seguir --
        VStack {
            Button{ viewModel.followToogle() } label: {
                Label(!viewModel.isFollowing ? "Follow" : "Unfollow",
                      systemImage: !viewModel.isFollowing ? "person.crop.circle.fill.badge.plus" : "person.crop.circle.badge.minus")
                .font(.title3)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .black)
            
            //Enviar Mensagem --
            Button{} label: {
                Label("Enviar Mensagem", systemImage: "paperplane.fill")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
        }.padding(30)
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
    }
}
