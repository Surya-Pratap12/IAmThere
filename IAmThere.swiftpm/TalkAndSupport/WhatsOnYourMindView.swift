import SwiftUI

struct WhatsOnYourMindView: View {
    @Environment(\.dismiss) var dismiss
    @State private var text: String = ""
    
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
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("What's on your mind?")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    
                    Text("Feel free to share anything. This is your private, safe space.")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.white)
                        .shadow(color: .blue.opacity(0.1), radius: 15, x: 0, y: 10)
                    
                    TextEditor(text: $text)
                        .padding(20)
                        .scrollContentBackground(.hidden)
                        .font(.system(.body, design: .rounded))
                    
                    if text.isEmpty {
                        Text("Start typing here...")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.gray.opacity(0.5))
                            .padding(25)
                            .allowsHitTesting(false)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                Button(action: {
                    // Action for sharing/saving
                }) {
                    Text("Share with Me")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .background(
                            Capsule()
                                .fill(Color(red: 0.1, green: 0.4, blue: 0.9))
                                .shadow(color: Color.blue.opacity(0.3), radius: 15, x: 0, y: 10)
                        )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    WhatsOnYourMindView()
}
