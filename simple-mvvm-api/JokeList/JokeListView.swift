import SwiftUI

struct JokeListView: View {
    @ObservedObject var viewModel = JokeListViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            } else if viewModel.jokes.isEmpty {
                Text("No jokes found")
            } else {
                listView
            }
        }
        .navigationTitle("Jokes")
        .onAppear {
            viewModel.fetchJokes()
        }
    }
    
    private var listView: some View {
        List(viewModel.jokes, id: \.id) { joke in
            VStack(alignment: .leading) {
                Text(joke.setup)
                    .font(.headline)
                Text(joke.punchline)
                    .font(.subheadline)
            }
        }
    }
}
