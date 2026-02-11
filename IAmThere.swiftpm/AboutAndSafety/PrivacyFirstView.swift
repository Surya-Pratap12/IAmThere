import SwiftUI

struct PrivacyFirstView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.white, Color(red: 1.0, green: 0.85, blue: 0.3)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.9, green: 0.5, blue: 0.1))
                            .padding(12)
                            .background(Circle().fill(Color.white))
                            .shadow(color: .orange.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                    Spacer()
                    Text("About & Safety")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.9, green: 0.5, blue: 0.1))
                    Spacer()
                    Color.clear.frame(width: 44)
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack(spacing: 20) {
                    Image(systemName: "lock.shield.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color(red: 0.9, green: 0.5, blue: 0.1))
                        .shadow(color: .orange.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    Text("Privacy First (Offline)")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        PrivacyPoint(icon: "wifi.slash", title: "100% Offline", description: "Your data never leaves your device. No servers, no tracking.")
                        PrivacyPoint(icon: "eye.slash.fill", title: "No Data Collection", description: "We don't collect, store, or sell your personal information.")
                        PrivacyPoint(icon: "lock.fill", title: "Your Safe Space", description: "Everything you write is for your eyes only.")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(.white)
                            .shadow(color: .orange.opacity(0.15), radius: 15, x: 0, y: 5)
                    )
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct PrivacyPoint: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(Color(red: 0.9, green: 0.5, blue: 0.1))
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.black)
                
                Text(description)
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.7))
            }
        }
    }
}

#Preview {
    PrivacyFirstView()
}
