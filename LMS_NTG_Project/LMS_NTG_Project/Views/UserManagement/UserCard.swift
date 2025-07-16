//
//  UserCard.swift
//  LMS_NTG_Project
//
//  Created by Naif on 21/01/1447 AH.
//

import SwiftUI

struct UserCard : View {
    var isActive : Bool = true
    var userType : UserType = .admin
    var username : String = "jenny Wilson"
    var email : String = "Jenny.wilson@gmail.com"
    
    var body: some View {
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
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black.opacity(0.15), lineWidth: 1)
            )
            .cornerRadius(20)
           
        // Using overlay + RoundedRectangle instead of .border()
        // .border() does NOT respect cornerRadius and draws a full rectangle
        // RoundedRectangle with .stroke() matches the corner radius perfectly
            
            
                
        
    }
}
