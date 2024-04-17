import Foundation

class JokeDetailViewModel: ObservableObject {
    @Published var joke: Joke?
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private let contentRepository: ContentRepository
    
    init(contentRepository: ContentRepository = DefaultContentRepository()) {
        self.contentRepository = contentRepository
    }
    
    func fetchJoke(id: Int) {
        isLoading = true
        error = nil
        
        contentRepository.fetchJoke(id: id) { [weak self] (joke, error) in
            guard let self = self else { return }
            self.isLoading = false
            
            if let error = error {
                self.error = error
                return
            }
            
            if let joke = joke {
                self.joke = joke
            }
        }
    }
}
