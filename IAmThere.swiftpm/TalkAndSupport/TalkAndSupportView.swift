import SwiftUI

struct TalkAndSupportView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.white, Color(red: 0.3, green: 0.6, blue: 1.0)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(Color(red: 0.1, green: 0.4, blue: 0.9))
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                
                VStack(spacing: 12) {
                    Text("Talk & Support")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("A safe space to share your thoughts and find the emotional support you need.")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
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
