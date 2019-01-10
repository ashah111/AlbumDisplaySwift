//
//  AlbumTests.swift
//  AlbumTests
//
//  Created by Ayushi shah on 2019-01-07.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//

import XCTest
@testable import AlbumDesign

class AlbumTests: XCTestCase{
    var viewModel: TableDelegate = AlbumViewModel()

    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testDownloadImage(){
        //provide a url and call download image function
        let imageFilePath = Bundle.main.path(forResource: "image", ofType: "png")
        let url = "https://via.placeholder.com/600/92c952"
        let pathtoimage = URL(string: imageFilePath!)
        let session = URLSessionMock()
        let manager = AlbumViewModel(session: session)
        do{
            let data = try Data(contentsOf: pathtoimage!)
            session.data = data
            manager.downloadImage(url: url, completion: {(path,image) in
                print("success")
            })
        }catch{
          print(error.localizedDescription)
        }
        
    }
    
    func testParseJSON(){
        //setup objects
        let session = URLSessionMock()
        let manager = AlbumViewModel(session: session)
        
        //
        let pathtodata = URL(fileURLWithPath: "/Users/ayushishah/Desktop/AlbumDesign/AlbumDesign/data.json")
        do {
            let data = try Data(contentsOf: pathtodata)
            session.data = data
            var result: [Album]
            manager.getJSONfromUrl(completion: {(json) in
                print(json[0].title)
                print(json[1].title)
            })
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
}
