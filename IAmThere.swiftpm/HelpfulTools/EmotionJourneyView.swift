import SwiftUI

struct EmotionJourneyView: View {
    @Environment(\.dismiss) var dismiss
    
    let patterns = [
        ("Monday", "Calm", Color.green),
        ("Tuesday", "Anxious", Color.orange),
        ("Wednesday", "Happy", Color.yellow),
        ("Thursday", "Calm", Color.green),
        ("Friday", "Reflective", Color.blue),
        ("Saturday", "Happy", Color.yellow),
        ("Sunday", "Peaceful", Color.green)
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.white, Color(red: 0.2, green: 0.9, blue: 0.5)],
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
                            .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.3))
                            .padding(12)
                            .background(Circle().fill(Color.white))
                            .shadow(color: .green.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                    Spacer()
                    Text("Helpful Tools")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.3))
                    Spacer()
                    Color.clear.frame(width: 44)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Emotion Journey")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                    
                    Text("Visualize your patterns, not your history. Focus on your growth.")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(patterns, id: \.0) { pattern in
                            HStack {
                                Text(pattern.0)
                                    .font(.system(.headline, design: .rounded))
                                    .fontWeight(.black)
                                    .foregroundColor(.black)
                                    .frame(width: 100, alignment: .leading)
                                
                                Spacer()
                                
                                Text(pattern.1)
                                    .font(.system(.subheadline, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Capsule().fill(pattern.2))
                                    .shadow(color: pattern.2.opacity(0.3), radius: 5, x: 0, y: 3)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(.white)
                                    .shadow(color: .green.opacity(0.1), radius: 10, x: 0, y: 5)
                            )
                        }
                    }
                    .padding()
                }
                
                VStack(spacing: 12) {
                    Text("Weekly Insight")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.3))
                    
                    Text("You've had a balanced week. Your focus on calmness is showing positive patterns.")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.center)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.white)
                        .shadow(color: .green.opacity(0.15), radius: 15, x: 0, y: 5)
                )
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    EmotionJourneyView()
}
