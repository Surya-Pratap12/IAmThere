import SwiftUI

struct AboutAndSafetyView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 1.0, green: 0.7, blue: 0.3), Color(red: 1.0, green: 0.5, blue: 0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer()
                
                Image(systemName: "shield.lefthalf.filled")
                    .font(.system(size: 100))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                
                VStack(spacing: 12) {
                    Text("About & Safety")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Your privacy is our priority. Explore our safety guidelines and commitment to you.")
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
    AboutAndSafetyView()
}
