import SwiftUI

struct JokeDetailView: View {
    let jokeID: Int
    @ObservedObject var viewModel = JokeDetailViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            } else if let joke = viewModel.joke {
                Text(joke.setup)
                    .font(.headline)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                Text(joke.punchline)
                    .font(.subheadline)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
            }
        }
        .navigationTitle("Joke Detail")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchJoke(id: jokeID)
        }
    }
}

