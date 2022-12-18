//
//  ViewController.swift
//  Filmler Uygulaması
//
//  Created by Hüdahan Altun on 9.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var kategorilerListesi:[Kategoriler] = [Kategoriler] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        veritabanıKopyala()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        kategorilerListesi = KategorilerDAO().tümKategorileriAl()// tüm kategoriler listeye atandı
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//kategorilerden birine tıklayınca diğer sayfaya geçilecek ve o sayfada ilgili katgori ile ilgili filmler yer alacak bunun için bu sayfadan diğer sayfaya kategori nesnesi yollamamız lazım.
        
        
        let indexx = sender as? Int //perform segue ile indexPath.row verisini aldık
        
        let gidilecekVC = segue.destination as! ViewControllerFilmler
        
        gidilecekVC.kategori = kategorilerListesi[indexx!]//VCFilmlerdeki kategori nesnesine buradan kategorilerListesi dizimizzden veriyi aktardık
        
    }

}


extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kategorilerListesi.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let kategori = kategorilerListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriHucre",for:indexPath) as! TableViewCellKategori
        
        cell.kategoriLabel.text = kategori.getKategori_ad()!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toFilmler", sender: indexPath.row)
    }
}

extension ViewController{
    
    func veritabanıKopyala(){
        
        let bundleYolu = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyala = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        
        if fileManager.fileExists(atPath: kopyala.path){
            
            print("veritabanı zaten kopyalandı")
        }else{
            
            do{
                
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyala.path)
                print("veritabanı kopyalama başarılı!")
                
            }catch{
                
                print("veritabanı kopyalamada hata!")
            }
        }
        
    }
}
