//
//  SwiftUIView.swift
//  Draggy
//
//  Created by Matt Novoselov on 22/03/24.
//

import SwiftUI

// The view that should be overlayed on top of the canvas to display notifications
struct NotificationsView: View {
    
    // Get notifications data
    @Environment(NotificationsData.self)
    private var notificationsData: NotificationsData
    
    var body: some View {
        
        VStack{
            Spacer()
            
            ZStack{
                // Display each notification
                ForEach(notificationsData.displayed.indices, id: \.self) { index in
                    let notification = notificationsData.displayed[index]
                    
                    // Display notification if it's not currently hidden
                    if notification.isShowing {
                        NotificationsBlob(text: notification.text)
                            .transition(.move(edge: .bottom).combined(with: .blurReplace))
                        
                            // Hide notification after 4 seconds
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                    withAnimation {
                                        // Set isShowing = false to hide notification
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

// Structure for the notification blob
struct NotificationsBlob: View {
    
    // Text that will be displayed inside of the notification
    var text: String
    
    var body: some View {
        
        Text(text)
            .foregroundStyle(.white)
            .fontWeight(.medium)
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 100)
                    .stroke(.nodeStroke, lineWidth: 4)
                    .background{
                        Color.nodeBackground
                            .blur(radius: 10)
                            .opacity(0.85)
                    }
            }
        
    }
}

#Preview {
    NotificationsBlob(text: "Hello Notification")
}
