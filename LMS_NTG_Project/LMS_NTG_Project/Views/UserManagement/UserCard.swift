//
//  UserCard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 21/01/1447 AH.
//

import SwiftUI

struct UserCard : View {
    var isActive : Bool = false
    var userType : UserType = .admin
    var username : String = "jenny"
    var email : String = "Jenny.wilson@gmail.com"
    
    var body: some View {
      
        ZStack{
            Color.gray.edgesIgnoringSafeArea(.all)
            
            HStack{
                VStack{
                    VStack(alignment: .leading){
                        Text("\(username)")
                        Text("\(email)")
                        
                        HStack{
                            Text("\(userType)")
                                .foregroundColor(Color.black)
                                .padding(6)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                            
                            Text(isActive ? "Active" : "disabled")
                                .foregroundColor(isActive ? Color.green : Color.black)
                                .padding(6)
                                .background(isActive ? Color.green.opacity(0.2) : Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .padding(.leading , 10)
                                
                        }
                    }
            }
           Spacer()
                HStack  (spacing:30){
                    Button{
                        print("edit")
                    } label : {
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.black)
                    }
                    
                    Button{
                        print("remove")
                    } label : {
                        Image(systemName: "trash.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.red)
                    }
                }
                .padding()

               
                
            }
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding()
            .background(Color.white)
            .border(.black)
            .cornerRadius(20)
            .padding(.horizontal)
            
            
                
        }
    }
}

