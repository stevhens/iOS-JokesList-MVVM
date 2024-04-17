import Foundation

class DefaultContentRepository: ContentRepository {
    let networkClient = DefaultNetworkClient()
    
    func fetchJokeList(completion: @escaping ([Joke]?, Error?) -> Void) {
        let urlString = "https://official-joke-api.appspot.com/jokes/ten"
        networkClient.fetchData(from: urlString) { (result: Result<[Joke], Error>) in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    func fetchJoke(id: Int, completion: @escaping (Joke?, Error?) -> Void) {
        let urlString = "https://official-joke-api.appspot.com/jokes/\(id)"
        networkClient.fetchData(from: urlString) { (result: Result<Joke, Error>) in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
