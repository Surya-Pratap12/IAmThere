import SwiftUI

struct WhoIsThisForView: View {
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
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color(red: 0.9, green: 0.5, blue: 0.1))
                        .shadow(color: .orange.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    Text("Who Is This For?")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                    
                    VStack(spacing: 12) {
                        Text("Everyone.")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.black)
                            .foregroundColor(Color(red: 0.9, green: 0.5, blue: 0.1))
                        
                        Text("Whether you're a student, a professional, a parent, or anyone navigating the complexities of life. I Am There is designed to be your silent companion through every emotion, age, and identity.")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black.opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
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

#Preview {
    WhoIsThisForView()
}
