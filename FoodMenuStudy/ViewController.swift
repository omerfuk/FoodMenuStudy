//
//  ViewController.swift
//  FoodMenuStudy
//
//  Created by Ömer Faruk Kılıçaslan on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yemeklerTableView: UITableView!
    
    var yemeklerListesi = [Yemekler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        
        //Nesneleri OLuşturma
        
        let y1 = Yemekler(yemekId: 1, yemekAdi: "Ayran", yemekResimAdi: "ayran", yemekFiyat: 3.0)
        let y2 = Yemekler(yemekId: 2, yemekAdi: "Baklava", yemekResimAdi: "baklava", yemekFiyat: 4.0)
        let y3 = Yemekler(yemekId: 3, yemekAdi: "Fanta", yemekResimAdi: "fanta", yemekFiyat: 5.0)
        let y4 = Yemekler(yemekId: 4, yemekAdi: "Izgara Somun", yemekResimAdi: "izgarasomun", yemekFiyat: 30.0)
        let y5 = Yemekler(yemekId: 5, yemekAdi: "Izgara Tavuk", yemekResimAdi: "izgaratavuk", yemekFiyat: 33.0)
        let y6 = Yemekler(yemekId: 6, yemekAdi: "Kadayıf", yemekResimAdi: "kadayif", yemekFiyat: 13.0)
        let y7 = Yemekler(yemekId: 7, yemekAdi: "Kahve", yemekResimAdi: "kahve", yemekFiyat: 33.0)
        let y8 = Yemekler(yemekId: 8, yemekAdi: "Köfte", yemekResimAdi: "kofte", yemekFiyat: 34.0)
        let y9 = Yemekler(yemekId: 9, yemekAdi: "Lazanya", yemekResimAdi: "lazanya", yemekFiyat: 38.0)
        let y10 = Yemekler(yemekId: 10, yemekAdi: "Makarna", yemekResimAdi: "makarna", yemekFiyat: 23.0)
        let y11 = Yemekler(yemekId: 11, yemekAdi: "Pizza", yemekResimAdi: "pizza", yemekFiyat: 31.0)
        let y12 = Yemekler(yemekId: 12, yemekAdi: "Su", yemekResimAdi: "su", yemekFiyat: 3.0)
        let y13 = Yemekler(yemekId: 13, yemekAdi: "Sütlaç", yemekResimAdi: "sutlac", yemekFiyat: 13.0)
        let y14 = Yemekler(yemekId: 14, yemekAdi: "Tiramisu", yemekResimAdi: "tiramisu", yemekFiyat: 13.0)
        
        yemeklerListesi.append(y1)
        yemeklerListesi.append(y2)
        yemeklerListesi.append(y3)
        yemeklerListesi.append(y4)
        yemeklerListesi.append(y5)
        yemeklerListesi.append(y6)
        yemeklerListesi.append(y7)
        yemeklerListesi.append(y8)
        yemeklerListesi.append(y9)
        yemeklerListesi.append(y10)
        yemeklerListesi.append(y11)
        yemeklerListesi.append(y12)
        yemeklerListesi.append(y13)
        yemeklerListesi.append(y14)
        
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource, YemekTableViewCellProtocol {
    func siparisVer(indexPath: IndexPath) {
        let gelenYemek = yemeklerListesi[indexPath.row]
        print("\(gelenYemek.yemekAdi!) Siparişi Verildi. Kazanç : \(gelenYemek.yemekFiyat!)")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gelenYemek = yemeklerListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "yemekHucre", for: indexPath) as! YemekTableViewCell
        
        cell.labelYemekAdi.text = gelenYemek.yemekAdi
        cell.labelYemekFiyat.text = "\(gelenYemek.yemekFiyat!) TL"
        cell.yemekResimImageView.image = UIImage(named: gelenYemek.yemekResimAdi!)
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
}

