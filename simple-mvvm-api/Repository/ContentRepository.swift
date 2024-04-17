import Foundation

protocol ContentRepository {
    func fetchJokeList(completion: @escaping ([Joke]?, Error?) -> Void)
    func fetchJoke(id: String, completion: @escaping (Joke?, Error?) -> Void)
}
