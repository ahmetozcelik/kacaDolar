//
//  ViewController.swift
//  KacaDolar
//
//  Created by Ahmet Özçelik on 30.11.2019.
//  Copyright © 2019 Ahmet Özçelik. All rights reserved.
//

import UIKit

let myUrl = "https://finans.truncgil.com/today.json"
let url = URL(string: myUrl)!
let myData = try! Data(contentsOf: url)
var jsonDecoder = JSONDecoder()
var dolarKuru:Double?

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       exchange()
    }
    func exchange() {
        
               let dovizler = try? jsonDecoder.decode(Doviz.self, from: myData)
               
               if let doviz = dovizler {
                print(doviz)
                dolarKuru = Double(doviz.ABDDOLARI.satis!)
                    
                  
               }
               
    }
    
    @IBOutlet weak var sayi: UITextField!
    @IBOutlet weak var exchangeTL: UILabel!
    
    @IBAction func exhangeTL(_ sender: Any) {
        if let sayi1 = Double(sayi.text!){
            exchangeTL.text = String(sayi1 * dolarKuru!)
       
        }
    }
}


