import Foundation

protocol ContentRepository {
    func fetchJokeList(completion: @escaping ([Joke]?, Error?) -> Void)
}
