//
//  ViewController.swift
//  ParsingJsonByDecodable
//
//  Created by Zihou Wong on 8/30/19.
//  Copyright © 2019 Zihou Wong. All rights reserved.
//

import UIKit

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    
}

struct Website_description: Decodable {
    let name: String?
    let description: String?
    let courses: [Course]?
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchJSON()
    }
    
    private func fetchJSON() {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
            } catch let jsonErr {
                print(jsonErr)
            }
            
        }.resume()
    }
}

