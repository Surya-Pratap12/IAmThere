import SwiftUI

struct PauseAndReflectView: View {
    @Environment(\.dismiss) var dismiss
    
    let prompts = [
        "What are three things you are grateful for today?",
        "What is one thing that made you smile this week?",
        "What is a challenge you overcame recently?",
        "How can you be extra kind to yourself today?",
        "What is a goal you're excited to work toward?"
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
                
                Spacer()
                
                VStack(spacing: 20) {
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.3))
                        .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    Text("Pause & Reflect")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(prompts, id: \.self) { prompt in
                                Text(prompt)
                                    .font(.system(.headline, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(.white)
                                            .shadow(color: .green.opacity(0.1), radius: 8, x: 0, y: 4)
                                    )
                            }
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

#Preview {
    PauseAndReflectView()
}
