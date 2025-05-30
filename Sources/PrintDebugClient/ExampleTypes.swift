struct User {
    let name: String
    let age: Int
    let email: String
}

struct Product {
    let id: Int
    let name: String
    let price: Double
    let inStock: Bool
}

enum APIError: Error {
    case networkError
    case invalidData
}

extension User {
    func fetchProfile() -> Result<String, APIError> {
        age > 0 ? .success("Profile for \(name)") : .failure(.invalidData)
    }
}
