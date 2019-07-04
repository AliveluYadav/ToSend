//
//  CollectionVC.swift
//  TaskB
//
//  Created by AktrixIOS01 on 18/06/18.
//  Copyright © 2018 Aktrix. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var displyImgArry=[Images]()
    
    var arr = [UIImage]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        do{
            
            dataSaved=try conte.fetch(Images.fetchRequest())

            for everyUser in dataSaved
            {
               if let image : UIImage = UIImage(data: everyUser.img!)
               {
                arr.append(image)
                
                print(arr)
            }
            }
            DispatchQueue.main.async {
                
                self.collectionView.reloadData()
            }
        }
            
        catch{

        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
     return arr.count
   
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell123", for: indexPath) as! CollectionViewCell
    
        
      cell.imgInCV.image =  arr[indexPath.row]
        
    
        
        return cell
    }

}
