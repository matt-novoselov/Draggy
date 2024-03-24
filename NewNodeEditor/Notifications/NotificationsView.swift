//
//  SwiftUIView.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 22/03/24.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(NotificationsData.self)
    private var notificationsData: NotificationsData
    
    
    var body: some View {
        
        VStack{
            Spacer()
            
            ZStack{
                ForEach(notificationsData.displayed.indices, id: \.self) { index in

                    NotificationsBlob(text: notificationsData.displayed[index])
                        .transition(.move(edge: .bottom).combined(with: .blurReplace))
                        .onAppear(){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                withAnimation{
                                    notificationsData.displayed.removeAll()
                                }
                            }
                        }
                    
                }
            }
        }

    }
}

struct NotificationsBlob: View {
    var text: String
    
    var body: some View {
        
        Text(text)
            .foregroundStyle(.white)
            .fontWeight(.medium)
            .padding()
            .background(.black.opacity(0.75))
            .cornerRadius(50)
            .shadow(color: .white, radius: 10)
        
    }
}

#Preview {
    NotificationsView()
        .environment(NotificationsData())
}
