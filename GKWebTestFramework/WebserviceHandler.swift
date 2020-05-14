//
//
//  Created by Yatindra on 02/04/18.
//  Copyright © 2017 Mac102. All rights reserved.
//

import UIKit
import Alamofire
import Foundation


public typealias JSONCallback = (Any?, String?, RequestStatus)->Void

public typealias JSONCallbackCodable = (Any?,Any?)->Void


public var authUsername: String = ""
public var authPassword: String = ""


 public let NodeGlobalURL: String = "http://118.189.213.8"       //Staging server
// public let MainGlobalURL: String = "http://118.189.213.8:8181"       //Staging server


//public let NodeGlobalURL: String = "http://103.24.7.20"       //Prod server
public let MainGlobalURL: String = "http://tkmk.wolerotechnology.com:8300"   //Prod server




public let MainbaseURL: String = "\(MainGlobalURL)/api/customer/"


public enum RequestStatus: Int{
    case OK             = 200
    case noAccount      = 201
    case error          = 202
    case notVerified    = 203
    case tokenExpire    = 204
    case requestDenied  = 401
    case invalidRequest = 400
}


public enum ApiName: String{

    case login = "login"
    case signup = "signup"
    case is_mobile_email_available = "is_mobile_email_available"
    case send_otp = "send_otp"
    case set_password = "set_password"
    case forget_password = "forget_password"
    case reset_password = "reset_password"
    case get_essentials = "get_essentials"
    case send_verification_mail = "send_verification_mail"

    case logout = "logout"

}
// call simple general api

public func callAPI(api: String, parameters: [String: Any], view: UIView?, completion: @escaping JSONCallbackCodable){


    let urlString = api
    print("URL - \(urlString)")


    let header  : HTTPHeaders = ["Content-Type": "application/json","Accept":"application/json"]

   // print("TOKEN - \("Bearer ".appending(defaults[.authToken]))")


    guard let url = URL(string: urlString), var request = try? URLRequest(url: url, method: .post, headers: header) else{
        completion(nil,nil)
        return
    }

    if let theJSONData = try? JSONSerialization.data(
        withJSONObject: parameters,
        options: []) {
        let theJSONText = String(data: theJSONData,
                                 encoding: .ascii)
        print("JSON string = \(theJSONText!)")
        request.httpBody = theJSONData
    }

    if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)! {

        request.cachePolicy = .reloadIgnoringCacheData

        AF.request(request).responseJSON { response in

//            print(response.result.value ?? "Error in \(api)")
            switch(response.result) {
            case .success(let value):
                print(value)
                completion(response.data,value)

            case .failure(_):
                //print("Error in :\(api)")
                completion(nil,nil)
            }
        }
    } else{
        completion(nil,nil)

    }
}





