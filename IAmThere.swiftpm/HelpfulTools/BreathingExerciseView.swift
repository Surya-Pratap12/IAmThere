import SwiftUI

struct BreathingExerciseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isInhaling = false
    @State private var breathText = "Breathe In"
    
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.white, Color(red: 0.2, green: 0.9, blue: 0.5)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
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
                
                VStack(spacing: 40) {
                    ZStack {
                        // Background circles for "breathing" effect
                        Circle()
                            .fill(Color(red: 0.2, green: 0.9, blue: 0.5).opacity(0.1))
                            .frame(width: 280, height: 280)
                            .scaleEffect(isInhaling ? 1.2 : 0.8)
                        
                        Circle()
                            .fill(Color(red: 0.2, green: 0.9, blue: 0.5).opacity(0.2))
                            .frame(width: 220, height: 220)
                            .scaleEffect(isInhaling ? 1.1 : 0.9)
                        
                        Circle()
                            .fill(Color(red: 0.2, green: 0.9, blue: 0.5))
                            .frame(width: 160, height: 160)
                            .shadow(color: .green.opacity(0.3), radius: 20, x: 0, y: 10)
                        
                        Image(systemName: "wind")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }
                    .animation(.easeInOut(duration: 4), value: isInhaling)
                    
                    VStack(spacing: 12) {
                        Text(breathText)
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.black)
                            .foregroundColor(.black)
                        
                        Text("Follow the circle to find your calm")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black.opacity(0.6))
                    }
                }
                .onReceive(timer) { _ in
                    isInhaling.toggle()
                    breathText = isInhaling ? "Breathe Out" : "Breathe In"
                }
                
                Spacer()
                
                VStack(spacing: 16) {
                    Text("Did you know?")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.1, green: 0.6, blue: 0.3))
                    
                    Text("Deep breathing helps lower your heart rate and signals your brain to relax. Just a few minutes can change your whole day.")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.white)
                        .shadow(color: .green.opacity(0.15), radius: 15, x: 0, y: 5)
                )
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    BreathingExerciseView()
}
