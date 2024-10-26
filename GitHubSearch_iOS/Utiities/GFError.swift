//
//  GFError.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 15/10/24.
//

import Foundation

enum GFError:String, Error{
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response form the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavourites = "There was an error setting this user as favourite. Please try again."
    case alreadyAFavourite = "This user is already in favourites."
}
