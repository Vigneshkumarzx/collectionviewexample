//
//  ViewController.swift
//  galleryusingcollectionview
//
//  Created by vignesh kumar c on 13/11/21.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var ImageArray:[UIImage] = []
   
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    let flowLayout2 = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func buttontaped(_ sender: Any) {
        openGallery()
    }
    
    func openGallery() {
        let alert = UIAlertController(title: "Title", message: "Nothing", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default){UIAlertAction in
            self.openCamera()
        }
        let gallery = UIAlertAction(title: "Photo Library", style: .default){ UIAlertAction in
            self.self.openPhotoLibrary()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(camera)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = .camera
        image.allowsEditing = true
        self.present(image, animated: true, completion: nil)
    }
    
    func openPhotoLibrary() {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = .photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true, completion: nil)
    }

    func didSelect(image: UIImage?) {
        
       
        guard let choosedImage = image else { return }
        self.ImageArray.append(choosedImage)
        collectionview.reloadData()
}
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage{
            self.didSelect(image: image)
            picker.dismiss(animated: true, completion: nil)
        }
    }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
    }
    
}

extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
    
        cell.gallaryimage.image = self.ImageArray[indexPath.item]
        return cell
        
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: (view.frame.width / 2), height: 80)
        }

func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                       minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
   }

   func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 0
  }
  
}


