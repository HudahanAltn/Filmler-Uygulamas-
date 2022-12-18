//
//  Yönetmenler.swift
//  Filmler Uygulaması
//
//  Created by Hüdahan Altun on 10.07.2022.
//

import Foundation


class Yönetmenler{
    
    private var yonetmen_id:Int?
    private var yonetmen_ad:String?
    
    init(){
        
        
    }
    init(yonetmen_id:Int,yonetmen_ad:String){
        
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
        
    }
    
    func getYönetmen_id()->Int?{
        
        return yonetmen_id!
    }
    
    func getYönetmen_ad()->String?{
        
        return yonetmen_ad!
    }
}
