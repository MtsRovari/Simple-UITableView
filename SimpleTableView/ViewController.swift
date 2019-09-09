//
//  ViewController.swift
//  SimpleTableView
//
//  Created by Mateus Rovari on 09/09/19.
//  Copyright © 2019 Mateus Rovari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    final let url = URL(string: "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1uylwIMisiZ9Kflj6Rhqrsphp5MDoYdz8ZoRizWcoqTA&sheet=places")
    
    private var places = [Actor]()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        downloadJson()
    }


    func downloadJson() {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            do {
                let decoder = JSONDecoder()
                let downloadedPlaces = try decoder.decode(Actors.self, from: data)
                self.places = downloadedPlaces.places
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
    
            } catch let jsonError{
                print(jsonError)
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell") as? ActorCell else {
            return UITableViewCell()
        }
        
        print("\(places[indexPath.row].place)")
        cell.nameLbl.text = places[indexPath.row].place
        cell.DOBLbl.text = places[indexPath.row].place_description
        
        return cell
    }
}

