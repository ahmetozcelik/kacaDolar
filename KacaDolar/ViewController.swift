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
var dolarKuru:Double?

class ViewController: UIViewController {
    
    @IBOutlet weak var sayi: UITextField!
    @IBOutlet weak var exchangeTL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       exchange()
    }
    func exchange() {
        guard let myData = try? Data(contentsOf: url) else { return print("HATA") }
            let dovizler = try? JSONDecoder().decode(Doviz.self, from: myData)
            
            if let doviz = dovizler {
                print(doviz)
                dolarKuru = Double(doviz.ABDDOLARI.satis!)
            }
    }
    @IBAction func exhangeTL(_ sender: Any) {
        if let sayi1 = Double(sayi.text!){
            if let dolarK = dolarKuru{
                exchangeTL.text = String(sayi1 * dolarK)}
        }
    }
}


