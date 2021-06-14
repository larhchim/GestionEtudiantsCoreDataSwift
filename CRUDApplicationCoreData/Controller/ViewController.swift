//
//  ViewController.swift
//  CRUDApplicationCoreData
//
//  Created by LARHCHIM ISMAIL on 6/7/21.
//  Copyright © 2021 LARHCHIM ISMAIL. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
     
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var lblnom: UITextField!
    
    
    @IBOutlet weak var lblprenom: UITextField!
    
    
    @IBOutlet weak var lblmodule: UITextField!
    
    
    @IBOutlet weak var lblnotes: UITextField!
    
    
    @IBOutlet weak var lblimage: UIImageView!
    
    var img:Data?
    
    @IBAction func openFileImage(_ sender: Any) {
        
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker,animated: true,completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         if let userPickerImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                           lblimage.image = userPickerImage
                 img = userPickerImage.pngData()
                imagePicker.dismiss(animated: true, completion: nil)
    }
        
    }

   
    
    @IBAction func ajouter(_ sender: UIButton) {
        
      
        
        let etd = Personne(context: context)

        
        etd.nom = self.lblnom.text
        etd.prenom = self.lblprenom.text
        etd.note = Float(self.lblnotes.text!)!
        etd.module = self.lblmodule.text
        etd.image = self.img 
    
       
        
        do {
            try context.save()
        }catch{}
        
    }
    

}

