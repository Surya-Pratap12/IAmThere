import SwiftUI

struct HomeView: View {
    @State private var showTalkOptions = false
    @State private var showHelpfulOptions = false
    @State private var navigateToWhatsOnYourMind = false
    @State private var navigateToAThoughtForYou = false
    @State private var navigateToTalkWithMe = false
    @State private var navigateToUnderstandingYourFeelings = false
    @State private var navigateToCrisisSupport = false
    
    @State private var navigateToBreathingExercise = false
    @State private var navigateToWriteYourThoughts = false
    @State private var navigateToPauseAndReflect = false
    @State private var navigateToEmotionJourney = false
    
    @State private var showAboutOptions = false
    @State private var navigateToPrivacyFirst = false
    @State private var navigateToSafeSpaceAndBoundaries = false
    @State private var navigateToWhoIsThisFor = false
    @State private var navigateToOurPromise = false
    
    let cards = [
        WellnessCard(title: "Talk & Support", icon: "bubble.left.and.bubble.right.fill", description: "Safe space for your thoughts", gradientColors: [.blue, .cyan]),
        WellnessCard(title: "Helpful Tools", icon: "heart.fill", description: "Breathing and reflection exercises", gradientColors: [.green, .mint]),
        WellnessCard(title: "About & Safety", icon: "shield.fill", description: "Your privacy is our priority", gradientColors: [.orange, .yellow])
    ]
    
    private var dailyAffirmation: String {
        let affirmations = [
            "Sunday": "Rest is productive. Recharging your energy is essential for your well-being.",
            "Monday": "You are capable of handling whatever this week brings with grace and strength.",
            "Tuesday": "Focus on progress, not perfection. Every small step forward is a victory.",
            "Wednesday": "You are doing your best, and that is more than enough. Be kind to yourself.",
            "Thursday": "Believe in your potential. You have the power to create a positive impact today.",
            "Friday": "Celebrate your wins, big and small. You've worked hard and deserve to feel proud.",
            "Saturday": "May your weekend be filled with peace, joy, and the things that make you smile."
        ]
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayOfWeek = formatter.string(from: Date())
        
        return affirmations[dayOfWeek] ?? "You are doing enough, you are enough."
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        HeaderView()
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Featured For You")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(cards) { card in
                                        FeatureCardButton(card: card) {
                                            if card.title == "Talk & Support" {
                                                showTalkOptions = true
                                            } else if card.title == "Helpful Tools" {
                                                showHelpfulOptions = true
                                            } else if card.title == "About & Safety" {
                                                showAboutOptions = true
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.bottom, 12)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Daily Affirmation")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 20)
                            
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                .fill(.white)
                                .frame(height: 130)
                                .padding(.horizontal, 20)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                                .overlay(
                                    Text("\"\(dailyAffirmation)\"")
                                        .font(.system(.title3, design: .rounded))
                                        .fontWeight(.bold)
                                        .italic()
                                        .foregroundColor(.primary)
                                        .padding(.horizontal, 40)
                                        .multilineTextAlignment(.center)
                                )
                        }
                        
                        Spacer()
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToWhatsOnYourMind) {
                WhatsOnYourMindView()
            }
            .navigationDestination(isPresented: $navigateToAThoughtForYou) {
                AThoughtForYouView()
            }
            .navigationDestination(isPresented: $navigateToTalkWithMe) {
                TalkWithMeView()
            }
            .navigationDestination(isPresented: $navigateToUnderstandingYourFeelings) {
                UnderstandingYourFeelingsView()
            }
            .navigationDestination(isPresented: $navigateToCrisisSupport) {
                CrisisSupportView()
            }
            .navigationDestination(isPresented: $navigateToBreathingExercise) {
                BreathingExerciseView()
            }
            .navigationDestination(isPresented: $navigateToWriteYourThoughts) {
                WriteYourThoughtsView()
            }
            .navigationDestination(isPresented: $navigateToPauseAndReflect) {
                PauseAndReflectView()
            }
            .navigationDestination(isPresented: $navigateToEmotionJourney) {
                EmotionJourneyView()
            }
            .navigationDestination(isPresented: $navigateToPrivacyFirst) {
                PrivacyFirstView()
            }
            .navigationDestination(isPresented: $navigateToSafeSpaceAndBoundaries) {
                SafeSpaceAndBoundariesView()
            }
            .navigationDestination(isPresented: $navigateToWhoIsThisFor) {
                WhoIsThisForView()
            }
            .navigationDestination(isPresented: $navigateToOurPromise) {
                OurPromiseView()
            }
            .sheet(isPresented: $showTalkOptions) {
                VStack(spacing: 16) {
                    Text("Talk & Support Options")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.black)
                        .padding(.top)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            TalkOptionButtonGradient(title: "What's on your mind?", icon: "pencil.and.outline") {
                                showTalkOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToWhatsOnYourMind = true
                                }
                            }
                            
                            TalkOptionButtonGradient(title: "A Thought For You", icon: "sparkles") {
                                showTalkOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToAThoughtForYou = true
                                }
                            }
                            
                            TalkOptionButtonGradient(title: "Talk With Me (Silent Support Mode)", icon: "person.circle.fill") {
                                showTalkOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToTalkWithMe = true
                                }
                            }
                            
                            TalkOptionButtonGradient(title: "Understanding Your Feelings", icon: "heart.circle.fill") {
                                showTalkOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToUnderstandingYourFeelings = true
                                }
                            }
                            
                            TalkOptionButtonGradient(title: "Crisis Support (Only When Needed)", icon: "exclamationmark.triangle.fill") {
                                showTalkOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToCrisisSupport = true
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showHelpfulOptions) {
                VStack(spacing: 16) {
                    Text("Helpful Tools Options")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.black)
                        .padding(.top)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            TalkOptionButtonGradientGreen(title: "Breathing Exercise", icon: "wind") {
                                showHelpfulOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToBreathingExercise = true
                                }
                            }
                            
                            TalkOptionButtonGradientGreen(title: "Write Your Thoughts", icon: "pencil.and.outline") {
                                showHelpfulOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToWriteYourThoughts = true
                                }
                            }
                            
                            TalkOptionButtonGradientGreen(title: "Pause & Reflect", icon: "leaf.fill") {
                                showHelpfulOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToPauseAndReflect = true
                                }
                            }
                            
                            TalkOptionButtonGradientGreen(title: "Emotion Journey (Pattern, Not History)", icon: "chart.line.uptrend.xyaxis") {
                                showHelpfulOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToEmotionJourney = true
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showAboutOptions) {
                VStack(spacing: 16) {
                    Text("About & Safety Options")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.black)
                        .padding(.top)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            TalkOptionButtonGradientYellow(title: "Privacy First (Offline)", icon: "lock.shield.fill") {
                                showAboutOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToPrivacyFirst = true
                                }
                            }
                            
                            TalkOptionButtonGradientYellow(title: "Safe Space & Boundaries", icon: "hand.raised.fill") {
                                showAboutOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToSafeSpaceAndBoundaries = true
                                }
                            }
                            
                            TalkOptionButtonGradientYellow(title: "Who Is This For?", icon: "person.2.fill") {
                                showAboutOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToWhoIsThisFor = true
                                }
                            }
                            
                            TalkOptionButtonGradientYellow(title: "Our Promise", icon: "heart.fill") {
                                showAboutOptions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    navigateToOurPromise = true
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
            }
        }
    }
}

struct TalkOptionButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(color)
            )
            .shadow(color: color.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

struct TalkOptionButtonGradient: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.9))
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: [Color.white, Color(red: 0.3, green: 0.6, blue: 1.0)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

struct TalkOptionButtonGradientGreen: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.3))
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: [Color.white, Color(red: 0.2, green: 0.9, blue: 0.5)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
            .shadow(color: Color.green.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

struct TalkOptionButtonGradientYellow: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .foregroundColor(Color(red: 0.9, green: 0.5, blue: 0.1))
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: [Color.white, Color(red: 1.0, green: 0.8, blue: 0.2)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
            .shadow(color: Color.orange.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

struct FeatureCardButton: View {
    let card: WellnessCard
    let action: () -> Void
    @State private var isHovered = false
    
    var body: some View {
        Button(action: action) {
            FeatureCardView(card: card)
                .scaleEffect(isHovered ? 1.05 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isHovered)
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { hovering in
            isHovered = hovering
        }
    }
}

#Preview {
    HomeView()
}
