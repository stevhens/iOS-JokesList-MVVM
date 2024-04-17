import Foundation

struct Joke: Codable, Identifiable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
