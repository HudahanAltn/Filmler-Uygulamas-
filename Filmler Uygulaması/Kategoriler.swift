//
//  Kategoriler.swift
//  Filmler Uygulaması
//
//  Created by Hüdahan Altun on 9.07.2022.
//

import Foundation


class Kategoriler{
    
    private var kategori_id:Int?
    private var kategori_ad:String?
    
    
    init(){
        
        
    }
    init(kategori_id:Int,kategori_ad:String){
        
        self.kategori_ad = kategori_ad
        self.kategori_id = kategori_id
        
        
    }
    
    func getKategori_id()->Int?{
        
        return kategori_id!
    }
    
    func getKategori_ad()->String?{
        
        return kategori_ad!
    }
}
