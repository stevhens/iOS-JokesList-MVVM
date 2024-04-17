import Foundation

protocol NetworkClient {
    func fetchData<T: Decodable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void)
}
