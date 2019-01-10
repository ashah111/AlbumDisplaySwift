//
//  ViewController.swift
//  Album Design
//
//  Created by Ayushi shah on 2019-01-04.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//

import UIKit

struct Album : Codable{
    var id:Int
    var title:String
    var url:String
}

class ViewController: UIViewController {
    
    let j_url = "http://jsonplaceholder.typicode.com/albums/1/photos"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSONfromUrl();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getJSONfromUrl (){
        let url = URL(string: j_url);
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler:{(data,response,error) in
            //error handling - use the try,catch and throw keywords
            //if let statement - check whether the optional contains a value and if so assign it to the var
            guard let data = data else{
                return
            }
            do{
                let json = try JSONDecoder().decode([Album].self, from: data)
                print("works")
            }catch{
                print("didnt work")
            }
            
        }).resume()
    }
}
