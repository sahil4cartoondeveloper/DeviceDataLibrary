//
//  PhotosDataResponse.swift
//  DeviceData_Example
//
//  Created by sahil vadadoriya on 22/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import ObjectMapper

struct PhotosDataResponse : Mappable {
    var albumId : Int?
    var id : Int?
    var title : String?
    var url : String?
    var thumbnailUrl : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        albumId <- map["albumId"]
        id <- map["id"]
        title <- map["title"]
        url <- map["url"]
        thumbnailUrl <- map["thumbnailUrl"]
    }

}
