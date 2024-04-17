import Foundation

protocol ContentRepository {
    func fetchJokeList(completion: @escaping ([Joke]?, Error?) -> Void)
    func fetchJoke(id: Int, completion: @escaping (Joke?, Error?) -> Void)
}
