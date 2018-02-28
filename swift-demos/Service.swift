//
//  Service.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/16.
//  Copyright © 2018年 youran. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private let IP = "http://192.168.50.199:1010"
public let PATH_GET = IP + "/department/findAll"
public let PATH_POST = IP + "/department/add"
// 设置请求方式
enum NetType{
    case get
    case post
}
func request(path: String,type: NetType,parameters : [String : Any]? = nil,completed :  @escaping (_ json : JSON,_ jsonDic: Any ,_ status : Bool) -> ()) {
    print(path)
    let method = type == .get ? HTTPMethod.get : HTTPMethod.post
    let header: HTTPHeaders = [
        "Accept": "application/json"
    ]
    Alamofire.request(path, method: method, parameters: parameters,encoding: JSONEncoding.default,headers: header).responseJSON { (response) in
        guard let result = response.result.value else{
//            completed(response.result.error!,false)
            print(String(describing: response.result.error))
            print("3---\(JSON(response.result.description))")
            print("4---\(response.result.description)")
            return
        }
//        completed(result,true)
//        let json = JSON(result)
//        print(json.type)
//        print(json["msg"].stringValue)
//        print(json["status"].boolValue)
//        print(json["data"].arrayValue)
//        let array = json["data"].arrayValue
//        for obj in array{
//            print(obj["name"].stringValue)
//        }
        print(result)
        completed(JSON(result),result,true)
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
