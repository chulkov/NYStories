//
//  NetworkService.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation

struct AppConst {
    private static let baseUrl = "https://api.nytimes.com/svc/"
    private static let apiKey = "CECy76L3w3DCoorQVz7gaz8h0s3q0sOv"
    
    static let topStories  = baseUrl + "topstories/v2/home.json?api-key=" + apiKey
}

final class NetworkAdapter {
    
    static var shared = NetworkAdapter()
    
    public func request<T: Decodable> (_ url: String,_ parameters: [String : Any] = [:], _ method: String = "GET",_ httpHeaders: String? = nil, success: @escaping (T) -> Void, failure: @escaping () -> () ) {
        
        let newUrl = Util.shared.encodeUrl(url)
        
        let postData = NSData(data: "".data(using: String.Encoding.utf8)!)
        let request = NSMutableURLRequest(url: NSURL(string: newUrl )! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 30.0)
        request.httpMethod = method
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if error != nil || data == nil {
                print(error ?? "Some error")
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let movieObject = try JSONDecoder().decode(T.self, from: data! )
                success(movieObject)
            } catch {
                print(error)
                failure()
            }
        })
        dataTask.resume()
    }
}
