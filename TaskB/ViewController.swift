//
//  ViewController.swift
//  TaskB
//
//  Created by AktrixIOS01 on 18/06/18.
//  Copyright © 2018 Aktrix. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
  
    var imageeeee=UIImage()
   
    @IBOutlet weak var imgvw: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func selectImgBtnAction(_ sender: UIButton) {
        
        
        let imagePC=UIImagePickerController()
        
        imagePC.delegate=self
        
    let alert = UIAlertController(title: "Add An Image", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Choose Photo Library", style: .default, handler: { (action:UIAlertAction) in
            
            imagePC.sourceType = .savedPhotosAlbum
            
            self.present(imagePC, animated: true, completion: nil)
            
        }))
        
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.imageeeee = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgvw.image = imageeeee

        picker.dismiss(animated: true, completion: nil)

    }
        ////////////////////
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func SaveImgInPList(_ sender: UIButton) {
        
        let userData=Images(context: conte)
  
        let imageName = UIImagePNGRepresentation(imageeeee) as NSData?
        
        userData.img = imageName! as Data
        
        appDel.saveContext()
        
        print(imageeeee)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"
        {
            let nvc = segue.destination as! CollectionVC
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

