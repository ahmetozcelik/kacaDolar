//
//  Webservice.swift
//  KacaDolar
//
//  Created by Ahmet Özçelik on 30.11.2019.
//  Copyright © 2019 Ahmet Özçelik. All rights reserved.
//

import Foundation


class Webservice {
    func load (url: URL, completion:@escaping([Doviz]?)->())
    {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {return}
            let response = try? JSONDecoder().decode([Doviz].self, from: data)
            
            if let response = response {
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }
}
