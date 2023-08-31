//
//  SmallAddButton.swift
//  ToDoDemo
//
//  Created by Melis Alsan on 30.07.2023.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        
        ZStack {
           
            Image(systemName: "plus")
            .font(.system(size: 30))
            
            
        }.foregroundColor(.white)
       

    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
