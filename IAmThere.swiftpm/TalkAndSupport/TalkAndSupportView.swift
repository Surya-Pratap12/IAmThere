import SwiftUI

struct TalkAndSupportView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.3, green: 0.6, blue: 1.0), Color(red: 0.1, green: 0.4, blue: 0.9)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                
                VStack(spacing: 12) {
                    Text("Talk & Support")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("A safe space to share your thoughts and find the emotional support you need.")
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
    TalkAndSupportView()
}
