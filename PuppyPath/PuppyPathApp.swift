//
//  PuppyPathApp.swift
//  PuppyPath
//
//  Created by Zoe Meller on 9/16/24.
//

import SwiftUI

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
            VStack {
                Image("welcome_image") // Add your hero image asset
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                Text("Welcome to PuppyPath")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("The best way to train and track your service dog.")
                    .font(.subheadline)
                    .padding(.top, 10)
                
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

// MARK: - Home Screen

struct HomeView: View {
    var body: some View {
        VStack {
            CircularProgressView(progress: 0.65) // Progress bar (65% progress)
                .padding()

            HStack {
                NavigationLink(destination: TrainingLogsView()) {
                    DashboardButton(iconName: "list.bullet", label: "Training Logs")
                }
                NavigationLink(destination: PuppyProfileView()) {
                    DashboardButton(iconName: "pawprint.fill", label: "Puppy Profile")
                }
            }
            HStack {
                NavigationLink(destination: EventsView()) {
                    DashboardButton(iconName: "calendar", label: "Events")
                }
                NavigationLink(destination: CommunityView()) {
                    DashboardButton(iconName: "person.3.fill", label: "Community")
                }
            }
        }
        .navigationTitle("PuppyPath Dashboard")
    }
}

// MARK: - Circular Progress View

struct CircularProgressView: View {
    var progress: Double

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(Angle(degrees: 270))
                .frame(width: 150, height: 150)

            Text(String(format: "%.0f%%", min(progress, 1.0) * 100.0))
                .font(.largeTitle)
                .bold()
        }
    }
}

// MARK: - Dashboard Button Component

struct DashboardButton: View {
    var iconName: String
    var label: String

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .padding()
            Text(label)
                .font(.headline)
        }
        .frame(width: 150, height: 150)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
}

// MARK: - Training Logs Screen

struct TrainingLogsView: View {
    var body: some View {
        List {
            TrainingLogRow(task: "Sit", date: "2024-09-15", completed: true)
            TrainingLogRow(task: "Stay", date: "2024-09-14", completed: false)
            TrainingLogRow(task: "Leash Walking", date: "2024-09-13", completed: true)
            // Add more logs as needed
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
            Image("puppy_image") // Add a placeholder or actual puppy image
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
