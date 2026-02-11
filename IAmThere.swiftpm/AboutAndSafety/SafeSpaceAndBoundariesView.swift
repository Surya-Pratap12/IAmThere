import SwiftUI

struct SafeSpaceAndBoundariesView: View {
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
                    Image(systemName: "hand.raised.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color(red: 0.9, green: 0.5, blue: 0.1))
                        .shadow(color: .orange.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    Text("Safe Space & Boundaries")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            BoundaryCard(title: "Respect", description: "This app is a judgment-free zone. Treat yourself with the same respect you'd give a friend.")
                            BoundaryCard(title: "Authenticity", description: "Be your true self. There's no right or wrong way to feel or express yourself here.")
                            BoundaryCard(title: "Growth", description: "Focus on your progress. Boundaries help protect your energy and mental space.")
                        }
                        .padding()
                    }
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct BoundaryCard: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(.headline, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Text(description)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black.opacity(0.7))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.white)
                .shadow(color: .orange.opacity(0.1), radius: 10, x: 0, y: 5)
        )
    }
}

#Preview {
    SafeSpaceAndBoundariesView()
}
