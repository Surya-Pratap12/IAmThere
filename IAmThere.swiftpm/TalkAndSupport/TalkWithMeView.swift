import SwiftUI

struct TalkWithMeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var messages: [ChatMessage] = []
    @State private var currentMessage: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.white, Color(red: 0.3, green: 0.6, blue: 1.0)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
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
                    VStack(spacing: 2) {
                        Text("Talk With Me")
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.black)
                            .foregroundColor(.black)
                        Text("(Silent Support Mode)")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.9))
                    }
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .font(.title)
                        .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.9))
                }
                .padding()
                .background(.white.opacity(0.8))
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(messages) { message in
                            HStack {
                                if message.isUser {
                                    Spacer()
                                    Text(message.text)
                                        .font(.system(.body, design: .rounded))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                .fill(Color(red: 0.1, green: 0.4, blue: 0.9))
                                        )
                                        .frame(maxWidth: 250, alignment: .trailing)
                                } else {
                                    Text(message.text)
                                        .font(.system(.body, design: .rounded))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                                .fill(.white)
                                        )
                                        .frame(maxWidth: 250, alignment: .leading)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                HStack(spacing: 12) {
                    TextField("Type your message...", text: $currentMessage)
                        .font(.system(.body, design: .rounded))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(.white)
                        )
                    
                    Button(action: sendMessage) {
                        Image(systemName: "paperplane.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Circle()
                                    .fill(Color(red: 0.1, green: 0.4, blue: 0.9))
                            )
                            .shadow(color: .blue.opacity(0.4), radius: 8, x: 0, y: 4)
                    }
                }
                .padding()
                .background(.white.opacity(0.8))
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            messages.append(ChatMessage(text: "Hello! I'm here to listen. Share anything on your mind—your feelings, your day, your dreams. No matter who you are or what you're going through, you're safe here.", isUser: false))
        }
    }
    
    private func sendMessage() {
        guard !currentMessage.isEmpty else { return }
        let userText = currentMessage
        messages.append(ChatMessage(text: userText, isUser: true))
        currentMessage = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let response = generateResponse(for: userText)
            messages.append(ChatMessage(text: response, isUser: false))
        }
    }
    
    private func generateResponse(for message: String) -> String {
        let lowercased = message.lowercased()
        
        // Emotion detection with empathetic responses
        if lowercased.contains("sad") || lowercased.contains("down") || lowercased.contains("depressed") || lowercased.contains("unhappy") {
            return [
                "I can see you're feeling sad. It's okay to feel this way. Remember, tough times don't last, but tough people do. You're stronger than you think.",
                "Sadness is a natural part of life. Allow yourself to feel it, and know that brighter days are ahead. You matter, and this feeling will pass.",
                "I'm here with you through this sadness. Remember: 'Every storm runs out of rain.' Things will get better, and you're not alone in this."
            ].randomElement()!
        }
        
        if lowercased.contains("happy") || lowercased.contains("joy") || lowercased.contains("excited") || lowercased.contains("great") {
            return [
                "That's wonderful! Your happiness is contagious. Keep celebrating these beautiful moments and share your joy with the world!",
                "I'm so glad you're feeling happy! Hold onto this feeling and remember it during challenging times. You deserve all this joy!",
                "Your happiness brings light to the world. Keep shining bright and spreading positivity wherever you go!"
            ].randomElement()!
        }
        
        if lowercased.contains("anxious") || lowercased.contains("worry") || lowercased.contains("worried") || lowercased.contains("nervous") || lowercased.contains("stressed") {
            return [
                "Anxiety can feel overwhelming, but you're handling it with courage. Take a deep breath. You've overcome challenges before, and you'll get through this too.",
                "I understand you're feeling anxious. Remember: 'You don't have to control your thoughts. You just have to stop letting them control you.' Take things one step at a time.",
                "Feeling anxious is tough, but you're tougher. Ground yourself in this moment. You are safe, you are capable, and this feeling will pass."
            ].randomElement()!
        }
        
        if lowercased.contains("angry") || lowercased.contains("mad") || lowercased.contains("frustrated") || lowercased.contains("annoyed") {
            return [
                "It's okay to feel angry. Your emotions are valid. Take a moment to breathe and know that it's okay to feel this way. You're human.",
                "Anger is a powerful emotion. What matters is how you channel it. You have the strength to turn this into positive change. I believe in you.",
                "I hear your frustration. Remember, it's not about suppressing anger but understanding it. You're doing great by expressing how you feel."
            ].randomElement()!
        }
        
        if lowercased.contains("lonely") || lowercased.contains("alone") || lowercased.contains("isolated") {
            return [
                "You're not alone, even when it feels that way. I'm here with you, and there are people who care about you deeply. Reach out when you're ready.",
                "Loneliness is hard, but remember: being alone doesn't mean you're lonely, and feeling lonely doesn't mean you're alone. You are valued and loved.",
                "I'm here for you. You matter more than you know, and your presence makes a difference in this world. You're never truly alone."
            ].randomElement()!
        }
        
        if lowercased.contains("tired") || lowercased.contains("exhausted") || lowercased.contains("drained") {
            return [
                "It's okay to be tired. Rest is not a luxury; it's a necessity. Give yourself permission to recharge. You deserve it.",
                "You've been working so hard. Remember, even the strongest people need rest. Take care of yourself—you're worth it.",
                "Being exhausted is your body's way of asking for care. Listen to it. Rest, recover, and come back stronger."
            ].randomElement()!
        }
        
        if lowercased.contains("scared") || lowercased.contains("afraid") || lowercased.contains("fear") {
            return [
                "Fear is natural, but it doesn't define you. You are brave for facing it. Remember: 'Courage is not the absence of fear, but the triumph over it.'",
                "It's okay to feel scared. But know that you are stronger than your fears. Take it one step at a time, and I'm here with you.",
                "Fear can feel overwhelming, but you have the power to move through it. You've faced challenges before, and you can do it again."
            ].randomElement()!
        }
        
        // Age-related and life situation responses
        if lowercased.contains("child") || lowercased.contains("kid") || lowercased.contains("young") {
            return "Every young person faces challenges, and it's okay to ask for help. You're growing, learning, and doing your best. Keep going—you're amazing just as you are!"
        }
        
        if lowercased.contains("old") || lowercased.contains("elderly") || lowercased.contains("senior") {
            return "Your experiences and wisdom are invaluable. Every stage of life has its beauty, and you continue to matter deeply. You are respected, valued, and loved."
        }
        
        if lowercased.contains("student") || lowercased.contains("school") || lowercased.contains("study") || lowercased.contains("exam") || lowercased.contains("college") || lowercased.contains("homework") {
            return [
                "Being a student is challenging, but you're learning and growing every day. Remember: 'Success is the sum of small efforts repeated day in and day out.' You've got this!",
                "Student life can be stressful, but you're doing amazing. Take breaks when needed, and remember that your worth isn't defined by grades. You are enough.",
                "Studies are important, but so are you. Balance is key. Take care of your mental health, and remember: you're capable of great things!"
            ].randomElement()!
        }
        
        if lowercased.contains("relationship") || lowercased.contains("breakup") || lowercased.contains("love") || lowercased.contains("partner") || lowercased.contains("boyfriend") || lowercased.contains("girlfriend") {
            return [
                "Relationships can be complicated. Remember, healthy relationships are built on respect, trust, and communication. You deserve to be treated with kindness and love.",
                "Whether you're in a relationship or healing from one, know that you are complete on your own. Love yourself first, and everything else will follow.",
                "Relationship challenges are tough, but they also help you grow. Trust yourself, communicate openly, and remember: you deserve happiness and respect."
            ].randomElement()!
        }
        
        if lowercased.contains("work") || lowercased.contains("job") || lowercased.contains("career") || lowercased.contains("boss") {
            return [
                "Work can be demanding, but remember to set boundaries. Your well-being matters more than any job. You're doing great, and you deserve balance.",
                "Career challenges are opportunities for growth. Trust in your abilities, and know that you bring unique value to what you do. Keep going!",
                "It's okay to feel overwhelmed at work. Take things one task at a time, and don't forget to celebrate your accomplishments, big or small."
            ].randomElement()!
        }
        
        if lowercased.contains("family") || lowercased.contains("parent") || lowercased.contains("mom") || lowercased.contains("dad") || lowercased.contains("sibling") {
            return [
                "Family dynamics can be complex. Remember, it's okay to set boundaries and prioritize your mental health. You are worthy of love and respect.",
                "Family relationships take work, but you're trying your best. Be patient with yourself and others, and remember: healing takes time.",
                "Your family situation is unique to you. Whatever you're going through, know that your feelings are valid and you deserve support."
            ].randomElement()!
        }
        
        if lowercased.contains("help") || lowercased.contains("support") {
            return "I'm here to support you. You're never alone in this journey. Keep sharing, and remember: asking for help is a sign of strength, not weakness."
        }
        
        // Gender-inclusive and universal support
        if lowercased.contains("gender") || lowercased.contains("identity") {
            return "You are valid exactly as you are. Your identity is yours alone, and you deserve to be respected and celebrated. You matter, and you belong."
        }
        
        // Default empathetic responses
        let defaultResponses = [
            "Thank you for sharing that with me. Your feelings are completely valid, and I'm here to listen.",
            "I hear you. Whatever you're going through, know that you're not alone. You're stronger than you think.",
            "It takes courage to open up. I'm glad you're here, and I'm listening with an open heart.",
            "Your words matter, and so do you. Keep talking—I'm here for you every step of the way.",
            "I appreciate you trusting me with your thoughts. Remember, you are worthy of love, kindness, and support.",
            "That's an important thing to share. Know that you're doing your best, and that's more than enough.",
            "I'm here with you. Whatever you're feeling right now is okay, and you deserve compassion and understanding."
        ]
        
        return defaultResponses.randomElement()!
    }
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

#Preview {
    TalkWithMeView()
}
