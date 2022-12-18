//
//  FilmlerDAO.swift
//  Filmler Uygulaması
//
//  Created by Hüdahan Altun on 10.07.2022.
//

import Foundation



class FilmlerDAO{
    
    var db:FMDatabase?
    
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabanıURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler.sqlite")
        
        db = FMDatabase(path: veritabanıURL.path)
    }
    
    
    
    func kategoriyeGöreFilmAl(kategori_id:Int)->[Filmler]{//kategori_id'ye göre filmleri getir
        
        var gelenKategoriListesi:[Filmler] = [Filmler]()
        
        db?.open()
        
        do{
            
            let rs = try db!.executeQuery("SELECT * FROM kategoriler,yonetmenler,filmler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = ? ", values: [kategori_id]) // kategori_id ye göre tablodan veri çekecek
            
            while rs.next(){
                
                let kategori = Kategoriler(kategori_id: Int(rs.string(forColumn: "kategori_id"))!, kategori_ad: rs.string(forColumn: "kategori_ad")!)
                
                let yonetmen = Yönetmenler(yonetmen_id: Int(rs.string(forColumn: "yonetmen_id"))!, yonetmen_ad: rs.string(forColumn: "yonetmen_ad")!)
                
                let film = Filmler(film_id: Int(rs.string(forColumn: "film_id"))!, film_ad: rs.string(forColumn: "film_ad")!, film_yil: Int(rs.string(forColumn: "film_yil"))!, film_resim: rs.string(forColumn: "film_resim")!, yonetmen: yonetmen, kategori: kategori)// yukarıdaki yonetmen ve kategori nesnesini bu filmler nesnesine geçmek için yarattık
                
                gelenKategoriListesi.append(film)
            
                
            }
            
            print("tüm kategorileri alma başarılı!")
        }catch{
            
            print("tüm kategorileri alma başarısız!")
            
        }
        
        db?.close()
        
        return gelenKategoriListesi
    }
}
