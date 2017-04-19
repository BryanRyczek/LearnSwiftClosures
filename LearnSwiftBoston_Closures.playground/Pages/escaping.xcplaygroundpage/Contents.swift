//: [Previous](@previous)

import Foundation
import UIKit

//  Closures are, by default, @noescape in Swift 3. If you want your closure to be escaping, you must mark it with @escaping.

// What is an escaping closure?
// An escaping closure is a closure within a function that is able to outlive, or escape, the life/scope of the function.

//Why would I use an escaping closure?
// Many async tasks call a closure when the task returns. In many cases, the function containing the closure will finish before the closure is called, resulting in a crash.

//When should I use escaping vs. non-escaping? Why not always escaping just to be safe?
//1) This is a memory management question. A closure keeps a strong reference to every object the closure captures. This includes references to self. It's impossible to create a reference cycle with a @noescape closure, therefore you should use @noescape (default setting) whenever possible.

//image source: https://swiftunboxed.com/lang/closures-escaping-noescape-swift3/
// @noescape closures
let noEscape = UIImage(named:"closure-noescape.png")

let escape = UIImage(named:"closure-escape.png")

// Example from Apple documentation

//since closures are first class citizens, they can be stored in arrays!
var completionHandlers: [() -> Void] = []

//Here we are attempting to store the completion handler in the array declared above. But we can't, unless the completion handler is defined as @escaping!

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

//basic completion handler closure
func downloadFileFromURL(url: URL, completion: (Bool) -> Void) {
    
    //download started
    
    /* if (download went poorly)
     */ //completion(false) // return Error
    
    /*if (download went well)
     */ completion(true) // return Data
    
}

//downloadFileFromURL(url: URL(fileURLWithPath: "") { (<#Bool#>) in
//    <#code#>
//}

downloadFileFromURL(url: URL(fileURLWithPath: "")){ result in
    if result {
        print("true")
    } else {
        print("false")
    }
}

//Here we have some boilerplate code for downloading a url in Swift 3. 

//Notice we take in: 1) a URL
//                   2) a completion closure that takes in (Data, Error) and returns Void.

open func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask

func loadDataFromURL(url: URL, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
    
    //dataTask takes a URL and returns (Data?, URLResponse?, Error?). Only one of the three comes back!
    
    let loadDataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
        //check for error response
        if let _ = error {
            //call completion handler with no data, but an error
            completion(nil, error)
        } else if let response = response as? HTTPURLResponse {
            if response.statusCode != 200 { //error check for response other than 200
                let statusError = NSError(domain: "com.raywenderlich",
                                          code: response.statusCode,
                                          userInfo: [NSLocalizedDescriptionKey: "HTTP status code has unexpected value."])
                //call completion handler with no data, but an error
                completion(nil, statusError)
            } else {
                //call completion hanler with data, no error
                completion(data, nil)
            }
        }
    }
    //resumes task if suspended (if for some reason it falls through...)
    loadDataTask.resume()
}

let darkSkyURL: URL = URL(fileURLWithPath: "https://api.darksky.net/forecast/23a28f0d66e063d657912a05530e33fc/37.8267,-122.4233")

loadDataFromURL(url: darkSkyURL) { (data, error) in
    // handle error, if any
    // do something with data
}
