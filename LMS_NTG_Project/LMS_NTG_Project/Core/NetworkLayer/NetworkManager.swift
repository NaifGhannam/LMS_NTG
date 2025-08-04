//
//  NetworkManager.swift
//  LMS_NTG_Project
//
//  Created by NTG on 28/07/2025.
//
import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func request<T: Decodable>(
        endpoint: APIEndpoint,
        body: Enchodable? = nil,
        headers: [String: String]? = nil
    ) async throws -> T {
        guard let url = URL(string: endpoint.url) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        // Default headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        if let token = TokenStore.shared.accessToken {
//            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        }

        // Custom headers
        headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }

        // Request body
        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknown
        }
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.requestFailed(httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
