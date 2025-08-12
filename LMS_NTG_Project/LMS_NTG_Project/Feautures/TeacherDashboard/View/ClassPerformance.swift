//
//  ClassPreformance.swift
//  LMS_NTG_Project
//
//  Created by Naif on 17/02/1447 AH.
//

import SwiftUI
import Charts

struct ClassPreformance: View {
    
    @State var data : [ClassOpject] = []
    
    
    var body: some View {
   
        VStack(alignment : .leading){
            Text("Class Preformance")
            HStack{
                Spacer()
                
                Text("Avreage Score % ")
                    .font(.caption)
                    .foregroundStyle(.btnText)

                Spacer()

            }
           
            Chart{
                ForEach(data ){ inst in
                    BarMark(
                        x : .value("CLASS NAME", inst.name),
                        y :.value("value", Double(inst.value))
                    ).foregroundStyle(inst.Color)
                    
                }
            }
        }//.padding()
     
        
        
        
    }
}

#Preview {
    ClassPreformance(data: [
        ClassOpject(name: "Grade 5A", value: 92 , Color : .green ),
        ClassOpject(name: "Grade 6A", value: 65, Color : .pink),
        ClassOpject(name: "Grade 6B", value: 80, Color : .blue)
    ]
    )
}

struct ClassOpject : Identifiable {
    var id : UUID = UUID()
    var name : String
    var value : Int
    var Color : Color
}

