//
//  RolesPermissions.swift
//  LMS_NTG_Project
//
//  Created by Naif on 28/01/1447 AH.
//

import SwiftUI

struct RolesPermissions: View {
    @State private var Roles: [TaskItem] = [
        TaskItem(title: "Role number 1"),
        TaskItem(title: "Role number 2"),
        TaskItem(title: "Role number 3"),
        TaskItem(title: "Role number 4"),
        TaskItem(title: "Role number 5")
        ]
    
    @State private var permissions: [PermissionItem] = [
           PermissionItem(title: "Permission", isSelected: false),
           PermissionItem(title: "Permission ", isSelected: true),
           PermissionItem(title: "Permission 3", isSelected: false)
       ]
    var body: some View {
        RolesPermissionsHeader()
        
        VStack(alignment : .leading){
            
            Text("Roles & Permissions")
                .font(.system(size:18))
                .foregroundColor(Color("PrimaryRed"))
                .bold()
                .padding(.leading , 20)
               
            TaskView(tasks: $Roles)
           HStack{
               Image(systemName: "key")
                   .resizable()
                   .frame(width: 16, height: 16)
                   .foregroundColor(Color.gray)
                   .padding()
               TextField("Role Description" , text: .constant(""))
                   .font(.headline)
                   .foregroundColor(Color("PrimaryRed"))
                   .padding()
            }
           .padding(.horizontal , 30)
           .cornerRadius(10)
           .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .foregroundColor(Color("PrimaryRed"))
           )
           .padding(.horizontal , 30)
           .shadow(color : .black.opacity(0.5), radius: 5 , x: 5, y: 5)
           .padding(.vertical, 30)
            
            // 3 checkbox
            VStack{
                HStack{
                    ForEach($permissions){ $permission in
                        HStack{
                            
                            Button(action:{
                                permission.isSelected.toggle()
                            }){
                                Image(systemName: permission.isSelected ? "checkmark.square.fill" : "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(permission.isSelected ? Color("PrimaryRed") : .gray)
                                Text(permission.title)
                                    .foregroundColor(.black)
                                
                            }
                        }
                        
                    }
                }.padding(.horizontal)
                
            }
            
                       
            
            // two red buttons
            HStack{
                
                Button{
                    print("save")
                       
                }label: {
                Text("Save")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                        .background(Color("PrimaryRed"))
                        .cornerRadius(50)
                        
                }
                .shadow(color: .black .opacity(0.5), radius : 5 ,x: 5, y: 5)
                Spacer()
                Button{
                    print("Reset To Default")
                       
                }label: {
                Text("Reset To Default")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .padding(.vertical , 20)
                        .background(Color("PrimaryRed"))
                        .cornerRadius(50)
                }
                .shadow(color: .black.opacity(0.5), radius: 5, x: 5, y: 5)
              
                
                
                
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal , 20)
            .padding(.top , 50)
            
            Spacer()
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        Spacer()
    }
}

struct PermissionItem: Identifiable {
    let id = UUID()
    var title: String
    var isSelected: Bool
}


#Preview {
    RolesPermissions()
}
