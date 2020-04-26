//
//  ViewController.swift
//  KacaDolar
//
//  Created by Ahmet Özçelik on 30.11.2019.
//  Copyright © 2019 Ahmet Özçelik. All rights reserved.
//

import UIKit

let exchangeURL = "https://finans.truncgil.com/today.json"
let url = URL(string: exchangeURL)!
var dolarRate:Double?

class ViewController: UIViewController {
    
    @IBOutlet weak var numberInput: UITextField!
    @IBOutlet weak var convertLabel: UILabel!
    @IBOutlet weak var writeDolarRate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       exchange()
        writeDolarRate.text = String(dolarRate!)
        
    }
    func exchange() {
        guard let myData = try? Data(contentsOf: url) else { return print("Veri yok. Internet baglantisini kontrol edin.") }
            let dovizler = try? JSONDecoder().decode(Doviz.self, from: myData)
            
            if let doviz = dovizler {
                print(doviz)
                dolarRate = Double(doviz.dolar.satis!)
            }
    }
    @IBAction func exchangeBtn(_ sender: Any) {
        if let sayi1 = Double(numberInput.text!){
            if let dolarKur = dolarRate{
                convertLabel.text = String(sayi1 * dolarKur)}
        }
    } 
}


