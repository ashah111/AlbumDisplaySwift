//
//  TableDelegate.swift
//  Album Design
//
//  Created by Ayushi shah on 2019-01-07.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//

import Foundation
import UIKit

protocol TableDelegate {
    func getJSONfromUrl(completion: @escaping ([Album]) -> Void)
    func downloadImage(url:String, completion: @escaping (URL?, UIImage?) -> Void)
}

class AlbumViewModel: TableDelegate {
    let j_url = "http://jsonplaceholder.typicode.com/albums/1/photos"
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
   
    func getJSONfromUrl(completion: @escaping ([Album]) -> Void){
        let url = URL(string: j_url);
        
        session.dataTask(with: (url as URL?)!, completionHandler:{(data,response,error) in
            guard let data = data
                else{
                    return
                }
            do{
                let json = try JSONDecoder().decode([Album].self, from: data)
                completion(json)
            }catch{
                return
            }
            
            
        }).resume()
    }
    
    func downloadImage(url:String, completion: @escaping (URL?, UIImage?) -> Void) {
        let url1 = URL(string: url)
        URLSession.shared.dataTask(with: (url1 as URL?)!, completionHandler:{(data,response,error) in
            guard let data = data else{
                return
            }
            completion(response?.url,UIImage(data: data)!)
        }).resume()
    }
}

