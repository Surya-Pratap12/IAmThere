import SwiftUI

struct HomeView: View {
    let cards = [
        WellnessCard(title: "Talk & Support", icon: "bubble.left.and.bubble.right.fill", description: "Safe space for your thoughts", gradientColors: [.blue, .cyan]),
        WellnessCard(title: "Helpful Tools", icon: "heart.fill", description: "Breathing and reflection exercises", gradientColors: [.green, .mint]),
        WellnessCard(title: "About & Safety", icon: "shield.fill", description: "Your privacy is our priority", gradientColors: [.orange, .yellow])
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HeaderView()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Featured For You")
                            .font(.system(.headline, design: .rounded))
                            .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(cards) { card in
                                    FeatureCardView(card: card)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 8)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Daily Affirmation")
                            .font(.system(.headline, design: .rounded))
                            .padding(.horizontal, 20)
                        
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(.white.opacity(0.5))
                            .frame(height: 120)
                            .padding(.horizontal, 20)
                            .overlay(
                                Text("\"You are doing enough, you are enough.\"")
                                    .font(.system(.body, design: .rounded))
                                    .italic()
                                    .padding(.horizontal, 40)
                                    .multilineTextAlignment(.center)
                            )
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
