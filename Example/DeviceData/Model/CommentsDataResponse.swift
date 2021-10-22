//
//  CommentsDataResponse.swift
//  DeviceData_Example
//
//  Created by sahil vadadoriya on 22/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import ObjectMapper

struct CommentsDataResponse : Mappable {
    var postId : Int?
    var id : Int?
    var name : String?
    var email : String?
    var body : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        postId <- map["postId"]
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        body <- map["body"]
    }

}
