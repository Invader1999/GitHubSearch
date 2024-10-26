//
//  PersistenceManager.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 18/10/24.
//

import Foundation

enum PerstistenceActionType{
    case add, remove
}

enum PersistenceManager{
    
    static private let defaults = UserDefaults.standard
    
    enum Keys{
        static let favourites = "favourites"
    }
    
    
    static func updateWith(favourite: Follower, actionType: PerstistenceActionType,completed: @escaping (GFError?) -> Void){
        retriveFavourites { result in
            switch result {
            case .success(var favourites):

                switch actionType {
                case .add:
                    guard !favourites.contains(favourite) else {
                        completed(.alreadyAFavourite)
                        return
                    }
                    
                    favourites.append(favourite)
                    
                case .remove:
                    favourites.removeAll{$0.login == favourite.login}
                }
                
                completed(save(favourites: favourites))
                
            case .failure(let error):
               completed(error)
            }
        }
    }
    
    
    static func retriveFavourites(completed: @escaping (Result<[Follower], GFError>) -> Void){
        guard let favouritesData = defaults.object(forKey: Keys.favourites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favourites = try decoder.decode([Follower].self, from: favouritesData)
            completed(.success(favourites))
        } catch {
            completed(.failure(.unableToFavourites))
        }
    }
    
    
    static func save(favourites:[Follower]) -> GFError?{
        do{
            let encoder = JSONEncoder()
            let encodedFavourites = try encoder.encode(favourites)
            defaults.setValue(encodedFavourites, forKey: Keys.favourites)
            return nil
        }catch{
            return .unableToFavourites
        }
    }
    
    
}
