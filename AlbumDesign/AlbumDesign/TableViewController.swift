//
//  TableViewController.swift
//  Album Design
//
//  Created by Ayushi shah on 2019-01-04.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//
^as
import Foundation
import UIKit

class TableViewController: UITableViewController{
    var size:Int = 1
    var json: [Album] = [Album]()
    var viewModel: TableDelegate = AlbumViewModel()
    var j_url = mainURL().url
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getJSONfromUrl(completion: {(json) in
            self.json = json
            self.size = json.count
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "album", for: indexPath)
        cell.textLabel?.text = json[indexPath.row].title
        cell.detailTextLabel?.text = String(json[indexPath.row].id)
        let image_url = self.json[indexPath.row].url
        DispatchQueue.global().async { [weak self] in
            self?.viewModel.downloadImage(url: image_url, completion: {(path,image) in
                if(path == URL(string: image_url)){
                    DispatchQueue.main.async {
                        cell.imageView?.image = image
                    }
                }
            })
        }
        return cell
    }
}
