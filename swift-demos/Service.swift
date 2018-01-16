//
//  Service.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/16.
//  Copyright © 2018年 youran. All rights reserved.
//

import Foundation
import Alamofire

private let IP = "http://192.168.50.199:1010"
public let PATH_GET = IP + "/department/findAll"
public let PATH_POST = IP + "/department/add"

enum NetType{
    case get
    case post
}
class ServiceTool{
    func request(path: String,type: NetType,parameters : [String : Any]? = nil,completed :  @escaping (_ result : Any,_ status : Bool) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(path, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else{
                print("hello")
                return
            }
            print("world")
        }
        
    }
}
func request(path: String,type: NetType,parameters : [String : Any]? = nil,completed :  @escaping (_ result : Any,_ status : Bool) -> ()) {
    let method = type == .get ? HTTPMethod.get : HTTPMethod.post
    Alamofire.request(path, method: method, parameters: parameters).responseJSON { (response) in
        guard let result = response.result.value else{
            completed(response.result.error!,false)
            return
        }
        completed(result,true)
    }
    
}
public func service_get(path: String) {
    
}
func postRequest(urlString:String, params : [String : Any], finished : @escaping (_ response : [String :AnyObject]?,_ error:NSError?)->()){
    
}

func service_post(path: String,params: [String : Any],completed:@escaping(_ response : [String: AnyObject]?,_ error: NSError?)->()){
    
}
func service_get(path: String,completed:@escaping(_ reponse:[String:AnyObject]?,_ error: NSError?)->()){
    Alamofire.request(path).responseJSON { (response) in
        guard let result = response.result.value else {
            print(response.result.error!)
            return
        }
        
//        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//            print("firstMethod --> responseData() --> utf8Text = \(utf8Text)")
//        }
    }
}
