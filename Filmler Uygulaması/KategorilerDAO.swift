//
//  KategorilerDAO.swift
//  Filmler Uygulaması
//
//  Created by Hüdahan Altun on 10.07.2022.
//

import Foundation

class KategorilerDAO{
    
    var db:FMDatabase?
    
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabanıURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        
        db = FMDatabase(path: veritabanıURL.path)
    }
    
    
    func tümKategorileriAl()->[Kategoriler]{//tüm kategorileri aldığımız metod
        
        var gelenKategoriListesi:[Kategoriler] = [Kategoriler]()
        
        db?.open()
        
        do{
            
            let rs = try db!.executeQuery("SELECT * FROM kategoriler", values: nil)
            
            while rs.next(){
                
                let kategori = Kategoriler(kategori_id: Int(rs.string(forColumn: "kategori_id"))!, kategori_ad: rs.string(forColumn:"kategori_ad")!)
                
                gelenKategoriListesi.append(kategori)
                
            }
            
            print("tüm kategorileri alma başarılı!")
            
        }catch{
            
            print("tüm kategorileri alma başarısız!")
            
        }
        
        db?.close()
        
        return gelenKategoriListesi
    }
}
