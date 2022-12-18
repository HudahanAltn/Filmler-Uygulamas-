//
//  ViewControllerDetay.swift
//  Filmler Uygulaması
//
//  Created by Hüdahan Altun on 9.07.2022.
//

import UIKit

class ViewControllerDetay: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var filmLabel: UILabel!
    @IBOutlet weak var yılLabel: UILabel!
    @IBOutlet weak var türLabel: UILabel!
    @IBOutlet weak var yönetmenLabel: UILabel!
    
    
    var film:Filmler?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let f = film{
            
            imageView.image = UIImage(named: f.getFilm_resim()!)
            filmLabel.text = f.getFilm_ad()!
            yılLabel.text = "\(f.getFilm_yil()!)"
            türLabel.text = f.getKategori()?.getKategori_ad()!
            yönetmenLabel.text = f.getYonetmen()?.getYönetmen_ad()!
        }
    }
    

  

}
