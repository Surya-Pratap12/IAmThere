import SwiftUI

struct WellnessCard: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let description: String
    let gradientColors: [Color]
}

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [
                Color(red: 0.90, green: 0.95, blue: 1.0), // Soft Blue
                Color(red: 0.95, green: 1.0, blue: 0.95)  // Mint
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Good Morning")
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(.secondary)
                Spacer()
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.gray.opacity(0.3))
            }
            
            Text("I Am There For You")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("How are you feeling?")
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.secondary)
                .padding(.top, 4)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

struct FeatureCardView: View {
    let card: WellnessCard
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: card.icon)
                .font(.system(size: 24))
                .foregroundStyle(.linearGradient(colors: card.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(10)
                .background(card.gradientColors.first?.opacity(0.12))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(card.title)
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.bold)
                
                Text(card.description)
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(16)
        .frame(width: 150, height: 160, alignment: .topLeading)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(.white.opacity(0.8))
                .background(.ultraThinMaterial)
        )
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: Color.black.opacity(0.03), radius: 8, x: 0, y: 4)
    }
}

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var isSkipped = false
    @State private var isHoveringSkip = false
    
    var body: some View {
        if isSkipped {
            HomeView()
        } else {
            ZStack {
                TabView(selection: $currentPage) {
                    TalkAndSupportView()
                        .tag(0)
                    
                    HelpfulToolsView()
                        .tag(1)
                    
                    AboutAndSafetyView()
                        .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // Page Indicator (Dots)
                    HStack(spacing: 8) {
                        ForEach(0..<3) { index in
                            Circle()
                                .fill(currentPage == index ? Color.white : Color.white.opacity(0.4))
                                .frame(width: 8, height: 8)
                                .scaleEffect(currentPage == index ? 1.2 : 1.0)
                                .animation(.spring(), value: currentPage)
                        }
                    }
                    .padding(.bottom, 24)
                    
                    // Skip Button with Hover Effect
                    Button(action: {
                        withAnimation {
                            isSkipped = true
                        }
                    }) {
                        Text(currentPage == 2 ? "Get Started" : "Skip")
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(buttonTextColor)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 50)
                            .background(
                                Capsule()
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 15, x: 0, y: 10)
                            )
                            .scaleEffect(isHoveringSkip ? 1.05 : 1.0)
                    }
                    .onHover { hovering in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isHoveringSkip = hovering
                        }
                    }
                    .padding(.bottom, 60)
                }
            }
        }
    }
    
    private var buttonTextColor: Color {
        switch currentPage {
        case 0: return Color(red: 0.1, green: 0.4, blue: 0.9)
        case 1: return Color(red: 0.1, green: 0.7, blue: 0.4)
        case 2: return Color(red: 1.0, green: 0.5, blue: 0.1)
        default: return .blue
        }
    }
}

struct ContentView: View {
    var body: some View {
        OnboardingView()
    }
}

#Preview {
    ContentView()
}
