import SwiftUI

struct UnderstandingYourFeelingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedFeeling: String = ""
    
    let feelings = [
        ("Anxious", "wind", Color.orange),
        ("Sad", "cloud.rain.fill", Color.blue),
        ("Happy", "sun.max.fill", Color.yellow),
        ("Angry", "flame.fill", Color.red),
        ("Calm", "leaf.fill", Color.green),
        ("Confused", "questionmark.circle.fill", Color.purple)
    ]
    
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
                    Text("Understanding Your Feelings")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                    
                    Text("Select how you're feeling right now")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(feelings, id: \.0) { feeling in
                            Button(action: {
                                selectedFeeling = feeling.0
                            }) {
                                VStack(spacing: 12) {
                                    Image(systemName: feeling.1)
                                        .font(.system(size: 50))
                                        .foregroundColor(feeling.2)
                                    
                                    Text(feeling.0)
                                        .font(.system(.headline, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 30)
                                .background(
                                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: feeling.2.opacity(0.3), radius: selectedFeeling == feeling.0 ? 20 : 10, x: 0, y: selectedFeeling == feeling.0 ? 8 : 5)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                                        .stroke(selectedFeeling == feeling.0 ? feeling.2 : Color.clear, lineWidth: 3)
                                )
                                .scaleEffect(selectedFeeling == feeling.0 ? 1.05 : 1.0)
                                .animation(.spring(response: 0.3), value: selectedFeeling)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                }
                
                if !selectedFeeling.isEmpty {
                    VStack(spacing: 12) {
                        Text("You're feeling \(selectedFeeling.lowercased())")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("It's okay to feel this way. Your emotions are valid.")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.black.opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.white)
                            .shadow(color: .blue.opacity(0.2), radius: 10, x: 0, y: 5)
                    )
                    .padding(.horizontal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    UnderstandingYourFeelingsView()
}
