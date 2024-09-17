//
//  PuppyPathApp.swift
//  PuppyPath
//
//  Created by Zoe Meller on 9/16/24.
//

import SwiftUI

// Define custom colors directly
extension Color {
    static let lightBlue = Color(red: 0.678, green: 0.847, blue: 0.902) // Light Blue
    static let softGreen = Color(red: 0.569, green: 0.937, blue: 0.749) // Soft Green
    static let paleYellow = Color(red: 1.0, green: 1.0, blue: 0.749) // Pale Yellow
    static let lightGrayBackground = Color(UIColor.systemGray6)
}

@main
struct PuppyPathApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}

// MARK: - Welcome Screen

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color.lightGrayBackground.ignoresSafeArea()

                VStack {
                    Image(systemName: "pawprint.fill") // Placeholder image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .padding(.top, 50)

                    Text("Welcome to PuppyPath")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, 20)

                    Text("The best way to train and track your service dog.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)

                    Spacer()

                    NavigationLink(destination: HomeView()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 50)
                }
                .padding()
            }
        }
    }
}

// MARK: - Home Screen

struct HomeView: View {
    var body: some View {
        ZStack {
            // Background color
            Color.lightGrayBackground.ignoresSafeArea()

            VStack(spacing: 30) {
                // Circular progress bar
                CircularProgressView(progress: 0.65)
                    .padding(.top, 40)

                // Dashboard Buttons
                HStack {
                    NavigationLink(destination: TrainingLogsView()) {
                        DashboardButton(iconName: "list.bullet", label: "Training Logs", color: .lightBlue)
                    }
                    NavigationLink(destination: PuppyProfileView()) {
                        DashboardButton(iconName: "pawprint.fill", label: "Puppy Profile", color: .softGreen)
                    }
                }

                HStack {
                    NavigationLink(destination: EventsView()) {
                        DashboardButton(iconName: "calendar", label: "Events", color: .paleYellow)
                    }
                    NavigationLink(destination: CommunityView()) {
                        DashboardButton(iconName: "person.3.fill", label: "Community", color: .lightBlue)
                    }
                }

                Spacer()
            }
            .navigationTitle("PuppyPath Dashboard")
        }
    }
}

// MARK: - Circular Progress View

struct CircularProgressView: View {
    var progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 20)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeOut, value: progress)
                .frame(width: 150, height: 150)

            Text(String(format: "%.0f%%", min(progress, 1.0) * 100.0))
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
        }
    }
}

// MARK: - Dashboard Button Component

struct DashboardButton: View {
    var iconName: String
    var label: String
    var color: Color

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(color)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

// MARK: - Training Logs Screen

struct TrainingLogsView: View {
    var body: some View {
        List {
            TrainingLogRow(task: "Sit", date: "2024-09-15", completed: true)
            TrainingLogRow(task: "Stay", date: "2024-09-14", completed: false)
            TrainingLogRow(task: "Leash Walking", date: "2024-09-13", completed: true)
        }
        .navigationTitle("Training Logs")
    }
}

struct TrainingLogRow: View {
    var task: String
    var date: String
    var completed: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task)
                    .font(.headline)
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: completed ? "checkmark.circle.fill" : "circle")
                .foregroundColor(completed ? .green : .gray)
        }
        .padding()
    }
}

// MARK: - Puppy Profile Screen

struct PuppyProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "pawprint.fill") // Placeholder image
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()

            Text("Buddy the Labrador")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            HStack {
                VStack(alignment: .leading) {
                    Text("Breed: Labrador Retriever")
                    Text("Age: 2 years")
                    Text("Training Level: Intermediate")
                }
                .font(.headline)
                .padding()
            }

            Spacer()

            Button(action: {
                // Action for viewing detailed reports
            }) {
                Text("View Reports")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 30)
        }
        .navigationTitle("Puppy Profile")
    }
}

// MARK: - Community Screen (Placeholder)

struct CommunityView: View {
    var body: some View {
        Text("Community Feature Coming Soon!")
            .font(.headline)
            .padding()
    }
}

// MARK: - Events Screen (Placeholder)

struct EventsView: View {
    var body: some View {
        Text("Events Feature Coming Soon!")
            .font(.headline)
            .padding()
    }
}
