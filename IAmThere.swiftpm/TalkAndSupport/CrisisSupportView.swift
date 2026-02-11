import SwiftUI

struct CrisisSupportView: View {
    @Environment(\.dismiss) var dismiss
    
    let crisisResources = [
        ("National Crisis Line", "988", "phone.fill"),
        ("Crisis Text Line", "Text HOME to 741741", "message.fill"),
        ("Emergency Services", "911", "exclamationmark.triangle.fill")
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
                
                Spacer()
                
                VStack(spacing: 16) {
                    Image(systemName: "heart.circle.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(Color(red: 0.1, green: 0.4, blue: 0.9))
                        .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    VStack(spacing: 8) {
                        Text("Crisis Support")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.black)
                            .foregroundColor(.black)
                        
                        Text("(Only When Needed)")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black.opacity(0.6))
                    }
                    
                    Text("You're not alone. Help is available 24/7.")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .padding(.top, 8)
                }
                
                VStack(spacing: 16) {
                    ForEach(crisisResources, id: \.0) { resource in
                        HStack(spacing: 16) {
                            Image(systemName: resource.2)
                                .font(.title2)
                                .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.9))
                                .frame(width: 50)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(resource.0)
                                    .font(.system(.headline, design: .rounded))
                                    .fontWeight(.black)
                                    .foregroundColor(.black)
                                
                                Text(resource.1)
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.9))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(.white)
                                .shadow(color: .blue.opacity(0.2), radius: 12, x: 0, y: 6)
                        )
                    }
                }
                .padding(.horizontal)
                
                VStack(spacing: 12) {
                    Text("Remember")
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                    
                    Text("Reaching out for help is a sign of strength, not weakness. You matter, and your life is valuable.")
                        .font(.system(.body, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.white.opacity(0.9))
                        .shadow(color: .blue.opacity(0.15), radius: 10, x: 0, y: 5)
                )
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CrisisSupportView()
}
