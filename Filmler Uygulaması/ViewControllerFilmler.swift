//
//  ViewControllerFilmler.swift
//  Filmler Uygulaması
//
//  Created by Hüdahan Altun on 9.07.2022.
//

import UIKit

class ViewControllerFilmler: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var filmlerListesi:[Filmler] = [Filmler]()
    
    var kategori:Kategoriler?// kategori nesnesi bir öcneki sayfadan gelecektir
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kategori{
            
            navigationItem.title = k.getKategori_ad()! //başlık dinamik olarak değişir
            
            filmlerListesi = FilmlerDAO().kategoriyeGöreFilmAl(kategori_id: k.getKategori_id()!)//VC'den gelen kategori id ye göre filmler alınır
        }
       
        
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let tasarım:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.collectionView.frame.size.width
        
        tasarım.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let hücreGenislikk =  ( genislik - 30 )/2
        
        tasarım.itemSize = CGSize(width: hücreGenislikk, height: hücreGenislikk*1.58)
        
        tasarım.minimumInteritemSpacing = 10
        tasarım.minimumLineSpacing = 10
        
        collectionView.collectionViewLayout = tasarım
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        collectionView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexx = sender as! Int
        
        let gidilecekVc = segue.destination as! ViewControllerDetay
        
        gidilecekVc.film = filmlerListesi[indexx]
        
        
    }
}


extension ViewControllerFilmler:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHücre", for: indexPath) as! CollectionViewCellFilmler
        
        cell.filmLabel.text = film.getFilm_ad()!
        cell.fiyatLabel.text = "24,99TL"
        cell.imageView.image = UIImage(named:film.getFilm_resim()!)
        
        //cell tasarımı
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        //Protocolü cell'e bağlamak
        cell.hücreProtocol = self
        cell.indexxPAth = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toFilmlerDetay", sender: indexPath.row)
    }
    
    
    
}


extension ViewControllerFilmler:CollectionViewCellFilmlerProtocol{
    func sepeteEkleProtocol(indexPath: IndexPath) {
        
        print("satın alınan film : \(filmlerListesi[indexPath.row].getFilm_ad()!)")
    }
    
    
    
}
