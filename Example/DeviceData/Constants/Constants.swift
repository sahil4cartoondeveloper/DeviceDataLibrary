//
//  Constants.swift
//  TestProject
//
//  Created by PIYUSH  GHOGHARI on 09/09/21.
//

import Foundation

class Constants: NSObject {
    struct Service {
        
        static let BaseURl = "https://jsonplaceholder.typicode.com/"
        
        static let kUser = BaseURl + "users"
        static let kPost = BaseURl + "posts"
        static let kComments = BaseURl + "comments"
        static let kAlbums = BaseURl + "albums"
        static let kPhotos = BaseURl + "photos"
        static let kTodos = BaseURl + "todos"
    }
    
    
}

enum ApiType {
    case one
    case two
    case three
    case four
    case five
    case six
}
