import SwiftUI

struct AThoughtForYouView: View {
    @Environment(\.dismiss) var dismiss
    
    private let thoughts = [
        "You are stronger than you think, braver than you believe, and more loved than you know.",
        "Every step forward, no matter how small, is progress worth celebrating.",
        "It's okay to take a break. Rest is not weakness; it's wisdom.",
        "Your feelings are valid. You don't need to justify them to anyone.",
        "You deserve kindness, especially from yourself.",
        "The sun will rise again tomorrow, and so will you.",
        "You are enough just as you are. You don't have to prove anything to anyone.",
        "Breathe. You are handling things better than you give yourself credit for.",
        "Your potential is endless. Keep going, one day at a time.",
        "Believe in the power of 'yet'. You haven't reached your goals *yet*, but you will.",
        "Be gentle with yourself. You're doing the best you can with what you have.",
        "Small progress is still progress. Keep your head up.",
        "You are the architect of your own happiness. Start building today.",
        "Your life is a beautiful journey. Enjoy the scenery along the way.",
        "Don't let yesterday take up too much of today.",
        "The best is yet to come. Keep moving forward with hope.",
        "You have the power to change your story at any moment.",
        "Focus on the good, and the good will get better.",
        "You are a work of art, always evolving and becoming more beautiful.",
        "Success is not final, failure is not fatal: it is the courage to continue that counts.",
        "Your dreams are worth pursuing. Don't give up on yourself.",
        "Happiness is found within. Nurture your inner light.",
        "You are worthy of all the good things that come your way.",
        "Every challenge is an opportunity to grow and become stronger.",
        "Kindness starts with you. Be kind to your heart today.",
        "You possess a unique light that only you can share with the world.",
        "The world is a better place because you are in it.",
        "Trust the timing of your life. Everything is unfolding as it should.",
        "You have within you the strength to overcome any obstacle.",
        "Your voice matters. Speak your truth with confidence.",
        "Cherish the little moments. They often lead to the biggest joy.",
        "You are capable of achieving greatness. Believe in yourself.",
        "Let go of what you cannot control and focus on your inner peace.",
        "Your journey is unique. Don't compare your Chapter 1 to someone else's Chapter 20.",
        "You are surrounded by love, even when you can't feel it.",
        "Forgive yourself for the past. Today is a fresh start.",
        "You are resilient. You have survived 100% of your hardest days.",
        "Radiate positivity, and the world will reflect it back to you.",
        "You are a masterpiece in progress. Embrace the process.",
        "Your mind is a powerful tool. Use it to create a life you love.",
        "You deserve to be happy. Don't let anyone tell you otherwise.",
        "The only person you should try to be better than is the person you were yesterday.",
        "You have a heart of gold. Keep sharing your warmth with others.",
        "Challenges are just stepping stones to your future success.",
        "You are an inspiration to those around you, even if you don't know it.",
        "Believe in your magic. You have something special to offer.",
        "The path to happiness is paved with gratitude.",
        "You are never too old to set another goal or to dream a new dream.",
        "Your hard work will pay off. Keep pushing forward.",
        "You are a force of nature. Nothing can stop you once you set your mind to it.",
        "Embrace your imperfections. They make you who you are.",
        "You have the strength to weather any storm that comes your way.",
        "Your future is bright. Keep walking toward the light.",
        "You are a beautiful soul, deserving of all the happiness in the world."
    ]
    
    @State private var currentThought: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.white, Color(red: 0.3, green: 0.6, blue: 1.0)],
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
                            .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.9))
                            .padding(12)
                            .background(Circle().fill(Color.white))
                            .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                    Spacer()
                    Text("Talk & Support")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.9))
                    Spacer()
                    Color.clear.frame(width: 44)
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack(spacing: 20) {
                    Image(systemName: "sparkles")
                        .font(.system(size: 80))
                        .foregroundStyle(Color(red: 0.1, green: 0.4, blue: 0.9))
                        .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    Text("A Thought For You")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                    
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.white)
                        .frame(height: 200)
                        .padding(.horizontal, 30)
                        .shadow(color: .blue.opacity(0.2), radius: 15, x: 0, y: 10)
                        .overlay(
                            Text("\"\(currentThought)\"")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .italic()
                                .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.9))
                                .padding(.horizontal, 50)
                                .multilineTextAlignment(.center)
                        )
                    
                    Button(action: {
                        withAnimation {
                            currentThought = thoughts.randomElement() ?? thoughts[0]
                        }
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("New Thought")
                        }
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 40)
                        .background(
                            Capsule()
                                .fill(Color(red: 0.1, green: 0.4, blue: 0.9))
                                .shadow(color: .blue.opacity(0.4), radius: 15, x: 0, y: 10)
                        )
                    }
                }
                
                Spacer()
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            currentThought = thoughts.randomElement() ?? thoughts[0]
        }
    }
}

#Preview {
    AThoughtForYouView()
}
