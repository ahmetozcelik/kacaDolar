//
//  Dolar.swift
//  KacaDolar
//
//  Created by Ahmet Özçelik on 30.11.2019.
//  Copyright © 2019 Ahmet Özçelik. All rights reserved.
//

import Foundation

struct Doviz:Codable {
    var ABDDOLARI:Dolar
    
    enum CodingKeys: String, CodingKey{
        case ABDDOLARI = "ABD DOLARI"
    }
}

struct Dolar:Codable{
    var alis:String?
    var satis:String?
    
    enum CodingKeys: String, CodingKey{
        case alis = "Alış"
        case satis = "Satış"
    }
}

