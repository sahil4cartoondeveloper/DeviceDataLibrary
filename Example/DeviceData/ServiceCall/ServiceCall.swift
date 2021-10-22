//
//  ServiceCall.swift
//  TestProject
//
//  Created by PIYUSH  GHOGHARI on 09/09/21.
//

import Foundation

class ServiceCall: NSObject {
    func getUserDataServiceCall(successBlock: @escaping (_ response: [UserDataModel]) -> (),
                                errorBlock: @escaping (_ errorMessage: String) -> ()) {
        
        ServiceManager.sharedInstance.callWebService(withURL: URL(string: Constants.Service.kUser)!,
                                                     withMethod: .get,
                                                     withParameter: nil,
                                                     withShowLoader: false,
                                                     withPushAppKey: false) { dicResponse in
            var userDataModelArray: [UserDataModel] = []
            for index in 0..<dicResponse.count {
                let objResponse = UserDataModel(JSON: dicResponse[index])
                userDataModelArray.append(objResponse!)
            }
            successBlock(userDataModelArray)
        } errorBlock: { (errorMessage: String) in
            errorBlock(errorMessage)
        }
    }
    
    func getPostDataServiceCall(successBlock: @escaping (_ response: [PostDataResponse]) -> (),
                                errorBlock: @escaping (_ errorMessage: String) -> ()) {
        ServiceManager.sharedInstance.callWebServiceTwo(withURL: URL(string: Constants.Service.kPost)!,
                                                        withMethod: .get,
                                                        withParameter: nil,
                                                        withShowLoader: false,
                                                        withPushAppKey: false) { dicResponse in
            var postDataResponseArray: [PostDataResponse] = []
            for index in 0..<dicResponse.count {
                let objResponse = PostDataResponse(JSON: dicResponse[index])
                postDataResponseArray.append(objResponse!)
            }
            successBlock(postDataResponseArray)
        } errorBlock: { (errorMessage: String) in
            errorBlock(errorMessage)
        }
    }
    
    func getCommentsDataServiceCall(successBlock: @escaping (_ response: [CommentsDataResponse]) -> (),
                                errorBlock: @escaping (_ errorMessage: String) -> ()) {
        
        ServiceManager.sharedInstance.callWebServiceTwo(withURL: URL(string: Constants.Service.kComments)!,
                                                     withMethod: .get,
                                                     withParameter: nil,
                                                     withShowLoader: false,
                                                     withPushAppKey: false) { dicResponse  in
            var commentDataResponseArray: [CommentsDataResponse] = []
            for index in 0..<dicResponse.count {
                let objResponse = CommentsDataResponse(JSON: dicResponse[index])
                commentDataResponseArray.append(objResponse!)
            }
            successBlock(commentDataResponseArray)
        } errorBlock: { (errorMessage: String) in
            errorBlock(errorMessage)
        }
    }
    
    func getAlbumsDataServiceCall(successBlock: @escaping (_ response: [AlbumsDataResponse]) -> (),
                                errorBlock: @escaping (_ errorMessage: String) -> ()) {
        
        ServiceManager.sharedInstance.callWebServiceTwo(withURL: URL(string: Constants.Service.kAlbums)!,
                                                     withMethod: .get,
                                                     withParameter: nil,
                                                     withShowLoader: false,
                                                     withPushAppKey: false) { dicResponse in
            var albumDataResponseArray: [AlbumsDataResponse] = []
            for index in 0..<dicResponse.count {
                let objResponse = AlbumsDataResponse(JSON: dicResponse[index])
                albumDataResponseArray.append(objResponse!)
            }
            successBlock(albumDataResponseArray)
        } errorBlock: { (errorMessage: String) in
            errorBlock(errorMessage)
        }
    }
    
    func getPhotosDataServiceCall(successBlock: @escaping (_ response: [PhotosDataResponse]) -> (),
                                errorBlock: @escaping (_ errorMessage: String) -> ()) {
        
        ServiceManager.sharedInstance.callWebServiceTwo(withURL: URL(string: Constants.Service.kPhotos)!,
                                                     withMethod: .get,
                                                     withParameter: nil,
                                                     withShowLoader: false,
                                                     withPushAppKey: false) { dicResponse in
            var photosDataResponseArray: [PhotosDataResponse] = []
            for index in 0..<dicResponse.count {
                let objResponse = PhotosDataResponse(JSON: dicResponse[index])
                photosDataResponseArray.append(objResponse!)
            }
            successBlock(photosDataResponseArray)
        } errorBlock: { (errorMessage: String) in
            errorBlock(errorMessage)
        }
    }
    
    func getTodosDataServiceCall(successBlock: @escaping (_ response: [TodosDataResponse]) -> (),
                                errorBlock: @escaping (_ errorMessage: String) -> ()) {
        
        ServiceManager.sharedInstance.callWebServiceTwo(withURL: URL(string: Constants.Service.kTodos)!,
                                                     withMethod: .get,
                                                     withParameter: nil,
                                                     withShowLoader: false,
                                                     withPushAppKey: false) { dicResponse in
            var todosDataResponseArray: [TodosDataResponse] = []
            for index in 0..<dicResponse.count {
                let objResponse = TodosDataResponse(JSON: dicResponse[index])
                todosDataResponseArray.append(objResponse!)
            }
            successBlock(todosDataResponseArray)
        } errorBlock: { (errorMessage: String) in
            errorBlock(errorMessage)
        }
    }
}
