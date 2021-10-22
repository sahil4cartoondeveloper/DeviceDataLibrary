//
//  DeviceData.swift
//  DeviceData
//
//  Created by sahil vadadoriya on 01/10/21.
//

import Foundation
import SystemConfiguration
import CoreTelephony
import CoreLocation
import UIKit

//MARK: - Model
public struct DeviceDataModel {
    let metric: String?
    let appID: String?
    let cpu: String?
    let ram: String?
    let batteryLife: String?
    let requestTime: String?
    let responseTime: String?
    let country: String?
    let state: String?
    let city: String?
    let mobileName: String?
    let osVersion: String?
    let uuid: String?
    let duration: String?
    let startTime: String?
    let activityName: String?
    let networkType: String?
    let appVersion: String?
    let appWifiSent: String?
    let appWifiReceived: String?
    let url: String?
    let responseCode: String?
    let type: String?
    
    public init (metric: String?, appID: String?, cpu: String?, ram: String?, batteryLife: String?, requestTime: String?, responseTime: String?, country: String?, state: String?, city: String?, mobileName: String?, osVersion: String?, uuid: String?, duration: String?, startTime: String?, activityName: String?, networkType: String?, appVersion: String?, appWifiSent: String?, appWifiReceived: String?, url: String?, responseCode: String?, type: String?) {
        
        self.metric = metric
        self.appID = appID
        self.cpu = cpu
        self.ram = ram
        self.batteryLife = batteryLife
        self.requestTime = requestTime
        self.responseTime = responseTime
        self.country = country
        self.state = state
        self.city = city
        self.mobileName = mobileName
        self.osVersion = osVersion
        self.uuid = uuid
        self.duration = duration
        self.startTime = startTime
        self.activityName = activityName
        self.networkType = networkType
        self.appVersion = appVersion
        self.appWifiSent = appWifiSent
        self.appWifiReceived = appWifiReceived
        self.url = url
        self.responseCode = responseCode
        self.type = type
    }
}

public class DeviceDetails: NSObject {
    
    //Variable
    var batteryLevel: Float { UIDevice.current.batteryLevel }
    var deviceDataModel: DeviceDataModel?
    var location: CLLocation?
    var country: String?
    var state: String?
    var city: String?
    var notificationCenter = NotificationCenter.default
    var requestTime: Double?
    var responseTime: Double?
    var url: URL?
    var statusCode: Int?
    
    public override init() {}
    
    public func getDeviceData(successBlock: @escaping (_ DeviceData: DeviceDataModel) -> ()) {
        self.addObserver()
        
        //Country, State and City
        LocationManager.shared.getCurrentReverseGeoCodedLocation { (location: CLLocation?, placemark: CLPlacemark?, error:NSError?) in
            guard let placemark = placemark else {
                return
            }
            print("Country :- \(placemark.country ?? "")")
            print("State :- \(placemark.administrativeArea ?? "")")
            print("City :- \(placemark.locality ?? "")")
            self.country = placemark.country
            self.state = placemark.administrativeArea
            self.city = placemark.locality
        }
        
        let secondsToDelay = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            self.deviceDataModel = self.deviceData()
            successBlock(self.deviceDataModel ?? DeviceDataModel(metric: "", appID: "", cpu: "", ram: "", batteryLife: "", requestTime: "", responseTime: "", country: "", state: "", city: "", mobileName: "", osVersion: "", uuid: "", duration: "", startTime: "", activityName: "", networkType: "", appVersion: "", appWifiSent: "", appWifiReceived: "", url: "", responseCode: "", type: ""))
        }
    }
    
    private func addObserver() {
        notificationCenter.addObserver(self, selector: #selector(getAPIData(notification:)), name: .APIDate, object: nil)
    }
    
    public func deviceData() -> DeviceDataModel {
        
        print("CPU :- \(String(describing: self.hostCPULoadInfo()))")
        print("Memory used in bytes :- \(self.report_memory())")
        print("batteryLevel :- \(batteryLevel)")
        print("Device Name :- \(UIDevice.current.name)")
        print("OS Version :- \(UIDevice.current.systemVersion)")
        print("UUID :- \(UIDevice.current.identifierForVendor?.uuidString ?? "")")
        let connectionType = getNetworkType()
        print("NetWork Type :- \(connectionType)")
        print("App Version :- \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")")
        
        self.deviceDataModel = DeviceDataModel(metric: "",
                                               appID: "",
                                               cpu: "\(String(describing: self.hostCPULoadInfo()))",
                                               ram: "\(self.report_memory())",
                                               batteryLife: "\(self.batteryLevel)",
                                               requestTime: "\(self.requestTime ?? Double())",
                                               responseTime: "\(self.responseTime ?? Double())",
                                               country:self.country,
                                               state: self.state,
                                               city: self.city,
                                               mobileName: "\(UIDevice.current.name)",
                                               osVersion: "\(UIDevice.current.systemVersion)",
                                               uuid: "\(UIDevice.current.identifierForVendor?.uuidString ?? "")",
                                               duration: "",
                                               startTime: "",
                                               activityName: "",
                                               networkType: connectionType,
                                               appVersion: "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")",
                                               appWifiSent: "",
                                               appWifiReceived: "",
                                               url: "\(self.url ?? URL(fileURLWithPath: ""))",
                                               responseCode: "\(self.statusCode ?? Int())",
                                               type: "")
        return deviceDataModel!
    }
    
    //    func getAppID() {
    //        guard let bundleID = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String else {
    //            return
    //        }
    //
    //        let url = "https://itunes.apple.com/lookup?bundleId=\(bundleID)"
    //
    //        Alamofire.request(url).responseJSON { response in
    //            guard let value = response.result.value else { return }
    //            let json = JSON(value)  // from: import SwiftyJSON
    //
    ////            let storeVersion = json["results"][0]["version"].stringValue
    ////            print("App Version :- \(storeVersion)")
    //
    //            let storeProductID = json["results"][0]["trackId"].intValue
    //            print("App ID :- \(storeProductID)")
    //
    ////            do {
    ////            let json = try JSONSerialization.jsonObject(with: value!, options: []) as? [String : Any]
    ////
    ////            } catch {
    ////                print("erroMsg")
    ////            }
    //        }
    //    }
    
    // CPU
    private func hostCPULoadInfo() -> host_cpu_load_info? {
        let HOST_CPU_LOAD_INFO_COUNT = MemoryLayout<host_cpu_load_info>.stride/MemoryLayout<integer_t>.stride
        var size = mach_msg_type_number_t(HOST_CPU_LOAD_INFO_COUNT)
        var cpuLoadInfo = host_cpu_load_info()
        
        let result = withUnsafeMutablePointer(to: &cpuLoadInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: HOST_CPU_LOAD_INFO_COUNT) {
                host_statistics(mach_host_self(), HOST_CPU_LOAD_INFO, $0, &size)
            }
        }
        if result != KERN_SUCCESS{
            print("Error  - \(#file): \(#function) - kern_result_t = \(result)")
            return nil
        }
        return cpuLoadInfo
    }
    
    //Ram
    func report_memory() -> String {
        var taskInfo = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }
        
        if kerr == KERN_SUCCESS {
            print("Memory used in bytes :- \(taskInfo.resident_size)")
        } else {
            print("Error with task_info() :- " +
                  (String(cString: mach_error_string(kerr), encoding: String.Encoding.ascii) ?? "unknown error"))
        }
        return "\(taskInfo.resident_size)"
    }
    
    // function of network type
    func getNetworkType() -> String {
        guard let reachability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, "www.google.com") else {
            return "NO INTERNET"
        }
        
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        let isReachable = flags.contains(.reachable)
        let isWWAN = flags.contains(.isWWAN)
        
        if isReachable {
            if isWWAN {
                let networkInfo = CTTelephonyNetworkInfo()
                if #available(iOS 12.0, *) {
                    let carrierType = networkInfo.serviceCurrentRadioAccessTechnology
                    guard let carrierTypeName = carrierType?.first?.value else {
                        return "UNKNOWN"
                    }
                    switch carrierTypeName {
                    case CTRadioAccessTechnologyGPRS, CTRadioAccessTechnologyEdge, CTRadioAccessTechnologyCDMA1x:
                        return "2G"
                    case CTRadioAccessTechnologyLTE:
                        return "4G"
                    default:
                        return "3G"
                    }
                } else {
                    // Fallback on earlier versions
                }
                return String()
            } else {
                return "WIFI"
            }
        } else {
            return "NO INTERNET"
        }
    }
    
    @objc func getAPIData(notification: Notification) {
        if let requestTime = notification.userInfo?["RequestTime"] as Any? {
            self.requestTime = requestTime as? Double
            print("Request Time :- \(requestTime)")
        }
        if let responseTime = notification.userInfo?["ResponseTime"] as Any? {
            self.responseTime = responseTime as? Double
            print("Response Time :- \(responseTime)")
        }
        if let url = notification.userInfo?["URL"] as? URL {
            self.url = url
            print("URL :- \(url)")
        }
        if let statusCode = notification.userInfo?["StatusCode"] as? Int {
            self.statusCode = statusCode
            print("Status Code :- \(statusCode)")
        }
    }
}

public extension Notification.Name {
    static let APIDate = Notification.Name("APIData")
}
