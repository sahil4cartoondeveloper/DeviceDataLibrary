//
//  Model.swift
//  TestProject
//
//  Created by PIYUSH  GHOGHARI on 09/09/21.
//

import Foundation
import ObjectMapper

//struct UserDataModel : Codable {
//    let id : Int?
//    let name : String?
//    let username : String?
//    let email : String?
//    let address : Address?
//    let phone : String?
//    let website : String?
//    let company : Company?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//        case username = "username"
//        case email = "email"
//        case address = "address"
//        case phone = "phone"
//        case website = "website"
//        case company = "company"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        username = try values.decodeIfPresent(String.self, forKey: .username)
//        email = try values.decodeIfPresent(String.self, forKey: .email)
//        address = try values.decodeIfPresent(Address.self, forKey: .address)
//        phone = try values.decodeIfPresent(String.self, forKey: .phone)
//        website = try values.decodeIfPresent(String.self, forKey: .website)
//        company = try values.decodeIfPresent(Company.self, forKey: .company)
//    }
//}
//
//struct Address : Codable {
//    let street : String?
//    let suite : String?
//    let city : String?
//    let zipcode : String?
//    let geo : Geo?
//
//    enum CodingKeys: String, CodingKey {
//
//        case street = "street"
//        case suite = "suite"
//        case city = "city"
//        case zipcode = "zipcode"
//        case geo = "geo"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        street = try values.decodeIfPresent(String.self, forKey: .street)
//        suite = try values.decodeIfPresent(String.self, forKey: .suite)
//        city = try values.decodeIfPresent(String.self, forKey: .city)
//        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
//        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
//    }
//}
//
//struct Company : Codable {
//    let name : String?
//    let catchPhrase : String?
//    let bs : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case name = "name"
//        case catchPhrase = "catchPhrase"
//        case bs = "bs"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
//        bs = try values.decodeIfPresent(String.self, forKey: .bs)
//    }
//}
//
//struct Geo : Codable {
//    let lat : String?
//    let lng : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case lat = "lat"
//        case lng = "lng"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        lat = try values.decodeIfPresent(String.self, forKey: .lat)
//        lng = try values.decodeIfPresent(String.self, forKey: .lng)
//    }
//}

struct UserDataModel : Mappable {
    var id : Int?
    var name : String?
    var username : String?
    var email : String?
    var address : Address?
    var phone : String?
    var website : String?
    var company : Company?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        address <- map["address"]
        phone <- map["phone"]
        website <- map["website"]
        company <- map["company"]
    }
}

struct Address : Mappable {
    var street : String?
    var suite : String?
    var city : String?
    var zipcode : String?
    var geo : Geo?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        street <- map["street"]
        suite <- map["suite"]
        city <- map["city"]
        zipcode <- map["zipcode"]
        geo <- map["geo"]
    }
}

struct Company : Mappable {
    var name : String?
    var catchPhrase : String?
    var bs : String?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        catchPhrase <- map["catchPhrase"]
        bs <- map["bs"]
    }
}

struct Geo : Mappable {
    var lat : String?
    var lng : String?

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        lat <- map["lat"]
        lng <- map["lng"]
    }
}
