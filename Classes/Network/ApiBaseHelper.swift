//
//  ApiBaseHelper.swift
//  RockyHelpers
//
//  Created by Airat Uraev on 06/11/15.
//
//

import Foundation

class ApiBaseHelper {
    
    class func parseResponse<ResponseType: AnyObject>(response: AnyObject!, operation: AFHTTPRequestOperation!, var path: String! = nil, debug: Bool = false, callback: (operation: AFHTTPRequestOperation!, result: [ResponseType]!, error: NSError!) -> ()){
        do {
            if let response = response as? NSDictionary {
                //
                if debug {
                    print("response => \(response)")
                }
                
                if path == nil {
                    path = "."
                }
                
                let commandObject: AnyObject! = response.valueForKeyPath(path)
                
                if let commands = commandObject as? [AnyObject] {
                    //
                    let results: [ResponseType]! = try MTLJSONAdapter.modelsOfClass(ResponseType.self, fromJSONArray: commands) as? [ResponseType]
                    
                    callback(operation: operation, result: results, error: nil)
                }
                
                if let commandsParams = commandObject as? [String: AnyObject] {
                    let result: ResponseType! = try MTLJSONAdapter.modelOfClass(ResponseType.self, fromJSONDictionary: commandsParams) as? ResponseType
                    
                    callback(operation: operation, result: [result], error: nil)
                }
            }
        }
        catch {
            print("parse response error => \(error)")
            callback(operation: operation, result: nil, error: NSError(domain: "Cannot parse response from server", code: 1001, userInfo: nil))
        }
    }
    
    class func POST<ResponseType where ResponseType: MTLModel, ResponseType: MTLJSONSerializing>(url: String, parameters: AnyObject!, path: String! = nil, debug: Bool = false, trace: Bool = false, callback: (operation: AFHTTPRequestOperation!, result: [ResponseType]!, error: NSError!) -> ()) -> AFHTTPRequestOperation! {
        
        if trace {
            print("trace parameters: \(parameters)")
        }
        
        return NetworkManager.sharedInstance.POST(url, parameters: parameters, success: { (operation: AFHTTPRequestOperation!, result: AnyObject!) -> Void in
            
            self.parseResponse(result, operation: operation, path: path, debug: debug, callback: callback)
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                //
                print("error post request => \(error)")
                callback(operation: operation, result: nil, error: error)
        })
    }
}