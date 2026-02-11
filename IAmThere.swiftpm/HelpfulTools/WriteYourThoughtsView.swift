import SwiftUI

struct WriteYourThoughtsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var text: String = ""
    
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
                    Text("Write Your Thoughts")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                    
                    Text("Release your feelings onto the page. No one else can see this.")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.white)
                        .shadow(color: .green.opacity(0.1), radius: 15, x: 0, y: 10)
                    
                    TextEditor(text: $text)
                        .padding(20)
                        .scrollContentBackground(.hidden)
                        .font(.system(.body, design: .rounded))
                    
                    if text.isEmpty {
                        Text("Start writing whatever is on your mind...")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.gray.opacity(0.5))
                            .padding(25)
                            .allowsHitTesting(false)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                Button(action: {
                    // Action for saving (offline)
                }) {
                    Text("Save to My Journal")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .background(
                            Capsule()
                                .fill(Color(red: 0.1, green: 0.6, blue: 0.3))
                                .shadow(color: Color.green.opacity(0.3), radius: 15, x: 0, y: 10)
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
    WriteYourThoughtsView()
}
