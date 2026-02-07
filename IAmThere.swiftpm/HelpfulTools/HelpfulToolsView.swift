import SwiftUI

struct HelpfulToolsView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.3, green: 0.9, blue: 0.5), Color(red: 0.1, green: 0.7, blue: 0.4)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                Image(systemName: "heart.text.square.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                
                VStack(spacing: 12) {
                    Text("Helpful Tools")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Access guided breathing, meditation, and reflection tools for your daily wellness.")
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.horizontal, 40)
                }
                
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    HelpfulToolsView()
}
