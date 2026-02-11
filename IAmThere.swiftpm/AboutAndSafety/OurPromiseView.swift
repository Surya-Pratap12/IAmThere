import SwiftUI

struct OurPromiseView: View {
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
                    Image(systemName: "heart.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color(red: 0.9, green: 0.5, blue: 0.1))
                        .shadow(color: .orange.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    Text("Our Promise")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        PromisePoint(title: "Continuous Support", description: "We promise to be here whenever you need a safe space.")
                        PromisePoint(title: "Constant Privacy", description: "We promise that your data will always remain on your device.")
                        PromisePoint(title: "Compassionate Care", description: "We promise to provide an environment that nurtures your mental wellness.")
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

struct PromisePoint: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(.headline, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Text(description)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black.opacity(0.7))
        }
    }
}

#Preview {
    OurPromiseView()
}
