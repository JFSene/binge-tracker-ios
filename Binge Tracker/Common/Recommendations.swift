//
//  Recommendations.swift
//  TraktKit
//
//  Created by Maximilian Litteral on 11/14/15.
//  Copyright © 2015 Maximilian Litteral. All rights reserved.
//

import Foundation

extension TraktManager {
    
    // MARK: - Public
    
    /**
     Personalized movie recommendations for a user. Results returned with the top recommendation first.
     
     🔒 OAuth: Required
     */
    @discardableResult
    public func getRecommendedMovies(completion: @escaping ArrayCompletionHandler) -> URLSessionDataTask? {
        return self.getRecommendations(.Movies, completion: completion)
    }
    
    /**
     Hide a movie from getting recommended anymore.
     
     🔒 OAuth: Required
     */
    @discardableResult
    public func hideRecommendedMovie<T: CustomStringConvertible>(movieID id: T, completion: @escaping SuccessCompletionHandler) -> URLSessionDataTask? {
        return hideRecommendation(type: .Movies, id: id, completion: completion)
    }
    
    /**
     Personalized show recommendations for a user. Results returned with the top recommendation first.
     
     🔒 OAuth: Required
     */
    @discardableResult
    public func getRecommendedShows(completion: @escaping ArrayCompletionHandler) -> URLSessionDataTask? {
        return self.getRecommendations(.Shows, completion: completion)
    }
    
    /**
     Hide a show from getting recommended anymore.
     
     🔒 OAuth: Required
     */
    @discardableResult
    public func hideRecommendedShow<T: CustomStringConvertible>(showID id: T, completion: @escaping SuccessCompletionHandler) -> URLSessionDataTask? {
        return hideRecommendation(type: .Shows, id: id, completion: completion)
    }
    
    // MARK: - Private
    
    @discardableResult
    private func getRecommendations(_ type: WatchedType, completion: @escaping ArrayCompletionHandler) -> URLSessionDataTask? {
        // Request
        guard
            let request = mutableRequest(forPath: "recommendations/\(type)",
                                           withQuery: [:],
                                           isAuthorized: true,
                                           withHTTPMethod: .GET) else { completion(.error(error: nil)); return nil }
        
        return performRequest(request: request, expectingStatusCode: StatusCodes.Success, completion: completion)
    }
    
    @discardableResult
    private func hideRecommendation<T: CustomStringConvertible>(type: WatchedType, id: T, completion: @escaping SuccessCompletionHandler) -> URLSessionDataTask? {
        // Request
        guard
            let request = mutableRequest(forPath: "recommendations/\(type)/\(id)",
                                         withQuery: [:],
                                         isAuthorized: true,
                                         withHTTPMethod: .DELETE) else { completion(.fail); return nil }
        return performRequest(request: request, expectingStatusCode: StatusCodes.SuccessNoContentToReturn, completion: completion)
    }
}
