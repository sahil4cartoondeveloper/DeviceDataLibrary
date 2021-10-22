//
//  ServiceManager.swift
//  iBC
//
//  Created by PIYUSH  GHOGHARI on 25/04/20.
//  Copyright © 2020 Omelette.inc. All rights reserved.
//


import UIKit
import Alamofire

class ServiceManager: NSObject {
    var strToken = String()
    var apiKey = String()
    var alamoFireManager = Alamofire.SessionManager.default
    var viewController: ViewController?
    var responseTime: Any?
    class var sharedInstance : ServiceManager {
        struct Static {
            static let instance : ServiceManager = ServiceManager()
        }
        return Static.instance
    }
    // METHODS
    override init()
    {
        alamoFireManager.session.configuration.timeoutIntervalForRequest = 360 //seconds
    }
    
    /*=================================================
     * Function Name: callWebService
     * Function Parameter: parameters
     * Function Return Type: dictResponse : [String : AnyObject]
     * Function Purpose: Common Service Calling function.
     ==================================================*/
    func callWebService(withURL url : URL,
                        withMethod methodName: HTTPMethod?,
                        withParameter parameters : Any?,
                        withShowLoader isShowLoader : Bool,
                        withPushAppKey isPushAppKey : Bool,
                        successBlock:@escaping (_ dictResponse : [[String : AnyObject]]) -> (),
                        errorBlock:@escaping (_ strMsg: String) -> ()) {
        
        if isShowLoader {
            LoaderView.shared.show()
        }
        
        var header = HTTPHeaders()
        header = [
            "Content-Type"      : "application/json",
            "Cache-Control"     : "no-cache",
            "Accept"            : "application/json",
            "Accept-Charset"    : "UTF-8"
        ]
        
        if let dictParam = parameters {
            if JSONSerialization.isValidJSONObject(dictParam) {
                let postData: Data? = try? JSONSerialization.data(withJSONObject: dictParam, options: [])
                let strParam = String(data: postData ?? Data(), encoding: .utf8)
                print("Parameters : \(strParam ?? "No Input Params")")
            }
            else {
                print("Input parameters is not a valid json")
                let error = NSError(domain: "", code: 300, userInfo: ["localizedDescription" : "Input parameters is not a valid json"])
                errorBlock((error.localizedDescription))
            }
        }
        
        Alamofire.request(url, method: methodName!, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: header)
            .responseString(completionHandler: { (strResponse) in
            })
            .responseJSON { response in
                
                //Request time And Response status code
                let requestExecutionTime = response.timeline.requestDuration
                let statusCode = response.response?.statusCode
                
                if(response.result.error != nil){
                    if isShowLoader {
                        LoaderView.shared.hide()
                    }
                    errorBlock(response.result.error?.localizedDescription ?? "")
                }else{
                    if let _ = response.result.value{
                        //Response Time
                        let responseExecutionTime = response.timeline.totalDuration
                        self.responseTime = responseExecutionTime
                        
                        if isShowLoader {
                            LoaderView.shared.hide()
                        }
                        successBlock(response.result.value as? [[String : AnyObject]] ?? [[:]])
                    }else{
                        if isShowLoader {
                            LoaderView.shared.hide()
                        }
                        errorBlock(response.result.error?.localizedDescription ?? "")
                    }
                }
                let apiData: [String: Any] = ["URL": url, "StatusCode": statusCode as Any, "RequestTime": requestExecutionTime, "ResponseTime": self.responseTime as Any]
                NotificationCenter.default.post(name: .APIDate,  object: nil, userInfo: apiData)
            }
    }
    
    /*=================================================
     * Function Name: callWebService
     * Function Parameter: parameters
     * Function Return Type: dictResponse : [String : AnyObject]
     * Function Purpose: Common Service Calling function.
     ==================================================*/
    func callWebServiceTwo(withURL url : URL,
                        withMethod methodName: HTTPMethod?,
                        withParameter parameters : Any?,
                        withShowLoader isShowLoader : Bool,
                        withPushAppKey isPushAppKey : Bool,
                        successBlock:@escaping (_ dictResponse : [[String : AnyObject]]) -> (),
                        errorBlock:@escaping (_ strMsg: String) -> ()) {
        
        if isShowLoader {
            LoaderView.shared.show()
        }
        
        var header = HTTPHeaders()
        header = [
            "Content-Type"      : "application/json",
            "Cache-Control"     : "no-cache",
            "Accept"            : "application/json",
            "Accept-Charset"    : "UTF-8"
        ]
        
        if let dictParam = parameters {
            if JSONSerialization.isValidJSONObject(dictParam) {
                let postData: Data? = try? JSONSerialization.data(withJSONObject: dictParam, options: [])
                let strParam = String(data: postData ?? Data(), encoding: .utf8)
                print("Parameters : \(strParam ?? "No Input Params")")
            }
            else {
                print("Input parameters is not a valid json")
                let error = NSError(domain: "", code: 300, userInfo: ["localizedDescription" : "Input parameters is not a valid json"])
                errorBlock((error.localizedDescription))
            }
        }
        
        Alamofire.request(url, method: methodName!, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: header)
            .responseString(completionHandler: { (strResponse) in
            })
            .responseJSON { response in
                
                //Request time And Response status code
                let requestExecutionTime = response.timeline.requestDuration
                let statusCode = response.response?.statusCode
                
                if(response.result.error != nil){
                    if isShowLoader {
                        LoaderView.shared.hide()
                    }
                    errorBlock(response.result.error?.localizedDescription ?? "")
                }else{
                    if let _ = response.result.value{
                        //Response Time
                        let responseExecutionTime = response.timeline.totalDuration
                        self.responseTime = responseExecutionTime
                        
                        if isShowLoader {
                            LoaderView.shared.hide()
                        }
                        successBlock(response.result.value as? [[String : AnyObject]] ?? [[:]])
                    }else{
                        if isShowLoader {
                            LoaderView.shared.hide()
                        }
                        errorBlock(response.result.error?.localizedDescription ?? "")
                    }
                }
                let apiData: [String: Any] = ["URL": url, "StatusCode": statusCode as Any, "RequestTime": requestExecutionTime, "ResponseTime": self.responseTime as Any]
                NotificationCenter.default.post(name: .APIDate,  object: nil, userInfo: apiData)
            }
    }
    
    /*=================================================
     * Function Name: callWebServiceArrayData
     * Function Parameter: parameters
     * Function Return Type: dictResponse : [String : AnyObject]
     * Function Purpose: Common Service Calling function.
     ==================================================*/
    func callWebServiceArrayData(withURL url : URL,
                                 withMethod methodName: HTTPMethod?,
                                 withParameter parameters : Any?,
                                 withShowLoader isShowLoader : Bool,
                                 withPushAppKey isPushAppKey : Bool,
                                 successBlock:@escaping (_ dictResponse : [[String : AnyObject]]) -> (),
                                 errorBlock:@escaping (_ strMsg: String) -> ()) {
        
        if isShowLoader {
            LoaderView.shared.show()
        }
        
        var header = HTTPHeaders()
        header = [
            "Content-Type"      : "application/json",
            "Cache-Control"     : "no-cache",
            "Accept"            : "application/json",
            "Accept-Charset"    : "UTF-8"
        ]
        
        print("Service URL : \(url)")
        print("header : \(header)")
        
        if let dictParam = parameters {
            if JSONSerialization.isValidJSONObject(dictParam) {
                let postData: Data? = try? JSONSerialization.data(withJSONObject: dictParam, options: [])
                let strParam = String(data: postData ?? Data(), encoding: .utf8)
                print("Parameters : \(strParam ?? "No Input Params")")
            }
            else {
                print("Input parameters is not a valid json")
                let error = NSError(domain: "", code: 300, userInfo: ["localizedDescription" : "Input parameters is not a valid json"])
                errorBlock((error.localizedDescription))
            }
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = methodName.map { $0.rawValue }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("UTF-8", forHTTPHeaderField: "Accept-Charset")
        request.setValue(strToken, forHTTPHeaderField: "Authorization")
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters as Any)
        
        Alamofire.request(request)
            .responseString(completionHandler: { (strResponse) in
            })
            .responseJSON { response in
                
                //Request time And Response status code
                let requestExecutionTime = response.timeline.requestDuration
                let statusCode = response.response?.statusCode
                
                if(response.result.error != nil){
                    
                    if isShowLoader {
                        LoaderView.shared.hide()
                    }
                    errorBlock(response.result.error?.localizedDescription ?? "")
                } else {
                    
                    //Response Time
                    let responseExecutionTime = response.timeline.totalDuration
                    self.responseTime = responseExecutionTime
                    
                    if let _ = response.result.value{
                        if isShowLoader {
                            LoaderView.shared.hide()
                        }
                        successBlock(response.result.value as? [[String : AnyObject]] ?? [[:]])
                    } else {
                        if isShowLoader {
                            LoaderView.shared.hide()
                        }
                        errorBlock(response.result.error?.localizedDescription ?? "")
                    }
                }
                let apiData: [String: Any] = ["URL": url, "StatusCode": statusCode as Any, "RequestTime": requestExecutionTime, "ResponseTime": self.responseTime as Any]
                NotificationCenter.default.post(name: .APIDate,  object: nil, userInfo: apiData)
            }
    }
    
    
    /*=================================================
     * Function Name: callWebServiceMediaData
     * Function Parameter: parameters
     * Function Return Type: dictResponse : [String : AnyObject]
     * Function Purpose: Common Service Calling function.
     ==================================================*/
    func callWebServiceMediaData(withURL url : URL,
                                 withMethod methodName: HTTPMethod?,
                                 withParameter parameters : [String : Any]?,
                                 imageData: Data?,
                                 withShowLoader isShowLoader : Bool,
                                 withPushAppKey isPushAppKey : Bool,
                                 successBlock:@escaping (_ dictResponse : [[String : AnyObject]]) -> (),
                                 errorBlock:@escaping (_ strMsg: String) -> ()) {
        
        if isShowLoader {
            LoaderView.shared.show()
        }
        
        var header = HTTPHeaders()
        header = [
            "Content-Type"      : "application/json",
            "Cache-Control"     : "no-cache",
            "Accept"            : "application/json",
            "Accept-Charset"    : "UTF-8"
        ]
        
        print("Service URL : \(url)")
        print("header : \(header)")
        
        if let dictParam = parameters {
            if JSONSerialization.isValidJSONObject(dictParam) {
                let postData: Data? = try? JSONSerialization.data(withJSONObject: dictParam, options: [])
                let strParam = String(data: postData ?? Data(), encoding: .utf8)
                print("Parameters : \(strParam ?? "No Input Params")")
            }
            else {
                print("Input parameters is not a valid json")
                let error = NSError(domain: "", code: 300, userInfo: ["localizedDescription" : "Input parameters is not a valid json"])
                errorBlock((error.localizedDescription))
            }
        }
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters! {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            if let data = imageData {
                multipartFormData.append(data, withName: "", fileName: "default.png", mimeType: "image/png")
            }
        }, usingThreshold: UInt64.init(), to: url, method: methodName!, headers: header) { (strResponse) in
            switch strResponse{
            case .success(let upload, _, _):
                upload.responseString(completionHandler: { (strResponse) in
                    print("strResponse:-> ",strResponse)
                })
                upload.responseJSON { response in
                    
                    //Request time And Response status code
                    let requestExecutionTime = response.timeline.requestDuration
                    let statusCode = response.response?.statusCode
                    
                    if let _ = response.error{
                        if isShowLoader {
                            LoaderView.shared.hide()
                        }
                        errorBlock(response.result.error.debugDescription)
                    }
                    //Response Time
                    let responseExecutionTime = response.timeline.totalDuration
                    self.responseTime = responseExecutionTime
                    if let _ = response.result.value{
                        if isShowLoader {
                            LoaderView.shared.hide()
                        }
                        successBlock(response.result.value as? [[String : AnyObject]] ?? [[:]])
                    }else{
                        if isShowLoader {
                            LoaderView.shared.hide()
                        }
                        errorBlock(response.result.error.debugDescription)
                    }
                    let apiData: [String: Any] = ["URL": url, "StatusCode": statusCode as Any, "RequestTime": requestExecutionTime, "ResponseTime": self.responseTime as Any]
                    NotificationCenter.default.post(name: .APIDate,  object: nil, userInfo: apiData)
                }
            case .failure(let error):
                if isShowLoader {
                    LoaderView.shared.hide()
                }
                errorBlock(error.localizedDescription)
            }
        }
    }
}
