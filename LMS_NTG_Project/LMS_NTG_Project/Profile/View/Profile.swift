//
//  Profile.swift
//  LMS_NTG_Project
//
//  Created by Naif on 09/02/1447 AH.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        HeaderView(title: "Profile & Settings")
        
        VStack{
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .padding(.leading)
                Spacer()
                VStack(alignment: .leading) {
                    HStack{
                        Text("Naif Almutairi")
                            .font(.headline)
                        
                        Button{
                            print( "Edit Profile" )
                        }label: {
                            Image("edit_profile")
                                .resizable()
                                .frame(width: 15, height: 15)
                                
                            
                        }
                    }
                    
                    
                    Text("naif.almutairi@gmail.com")
                    
                }
                .padding(.trailing , 60)
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color.white)
           // .border(Color.gray, width: 1)
            
            Rectangle()
                .frame(height: 1)
                .padding(.horizontal, 30)
                .foregroundColor(Color("line_color"))
            VStack{
                Button{
                    print("Notifications")
                }label: {
                    Image("bell2")
                        .foregroundStyle( .black)
                        .font(.system(size: 20, weight: .regular))
                    Text("Notifications")
                        .foregroundStyle( .black)
                        .font(.system(size: 18, weight: .regular))
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle( .black)
                        .font(.system(size: 20, weight: .regular))
                    
                }.frame(height: 50)
                    .padding()
                
                
                Button{
                    print("Language ")
                }label: {
                    Image("Language")
                        .foregroundStyle( .black)
                        .font(.system(size: 20, weight: .regular))
                    Text("Language ")
                        .foregroundStyle( .black)
                        .font(.system(size: 18, weight: .regular))
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle( .black)
                        .font(.system(size: 20, weight: .regular))
                    
                }.frame(height: 50)
                    .padding()
                
                
                Button{
                    print("Change password")
                }label: {
                    Image("password2")
                        .foregroundStyle( .black)
                        .font(.system(size: 20, weight: .regular))
                    Text("Change password ")
                        .foregroundStyle( .black)
                        .font(.system(size: 18, weight: .regular))
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle( .black)
                        .font(.system(size: 20, weight: .regular))
                    
                }.frame(height: 50)
                    .padding()
                
            }.padding(20)
            
            Spacer()
        }
    }
}

#Preview {
    Profile()
}
