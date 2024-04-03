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
                    let notification = notificationsData.displayed[index]
                    
                    if notification.isShowing {
                        NotificationsBlob(text: notification.text)
                            .transition(.move(edge: .bottom).combined(with: .blurReplace))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    withAnimation {
                                        notificationsData.displayed[index].isShowing = false
                                    }
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
            .background{
//                Color.nodeBackground
//                    .blur(radius: 10)
//                    .opacity(0.85)
                
                RoundedRectangle(cornerRadius: 50)
                    .stroke(.nodeStroke, lineWidth: 4)
                    .background{
                        Color.nodeBackground
                            .blur(radius: 10)
                            .opacity(0.85)
                    }
            }
//            .stroke(.nodeStroke, lineWidth: 8)
//            .cornerRadius(50)
        
    }
}

#Preview {
    NotificationsView()
        .environment(NotificationsData())
}
