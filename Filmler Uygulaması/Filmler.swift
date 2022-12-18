//
//  Filmler.swift
//  Filmler Uygulaması
//
//  Created by Hüdahan Altun on 10.07.2022.
//

import Foundation


class Filmler{
    
    private var film_id:Int?
    private var film_ad:String?
    private var film_yil:Int?
    private var film_resim:String?
    private var yonetmen:Yönetmenler?
    private var kategori:Kategoriler?
    
    
    init(film_id:Int,film_ad:String,film_yil:Int,film_resim:String,yonetmen:Yönetmenler,kategori:Kategoriler){
        
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.film_resim = film_resim
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
    
    func getFilm_id()->Int?{
        
        return film_id!
    }
    
    func getFilm_ad()->String?{
        
        return film_ad!
    }
    
    func getFilm_yil()->Int?{
        
        return film_yil!
    }
    
    func getFilm_resim()->String?{
        
        return film_resim!
    }
    
    func getYonetmen()->Yönetmenler?{
        
        return yonetmen!
        
    }
    
    func getKategori()->Kategoriler?{
        
        return kategori!
    }
}
