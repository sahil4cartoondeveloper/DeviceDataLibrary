//
//  PostDataResponse.swift
//  DeviceData_Example
//
//  Created by sahil vadadoriya on 22/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import ObjectMapper

struct PostDataResponse : Mappable {
    var userId : Int?
    var id : Int?
    var title : String?
    var body : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }

}

