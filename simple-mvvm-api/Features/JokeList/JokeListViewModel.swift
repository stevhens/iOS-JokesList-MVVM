import Foundation

class JokeListViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private let contentRepository: ContentRepository
    
    init(contentRepository: ContentRepository = DefaultContentRepository()) {
        self.contentRepository = contentRepository
    }
    
    func fetchJokes() {
        isLoading = true
        error = nil
        
        contentRepository.fetchJokeList { [weak self] (jokes, error) in
            guard let self = self else { return }
            self.isLoading = false
            
            if let error = error {
                self.error = error
                return
            }
            
            if let jokes = jokes {
                self.jokes = jokes
            }
        }
    }
}
