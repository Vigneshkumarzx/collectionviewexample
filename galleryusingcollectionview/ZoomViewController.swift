//
//  ZoomViewController.swift
//  galleryusingcollectionview
//
//  Created by vignesh kumar c on 18/11/21.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var ImageTapped: UIImageView!
    
    var img = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        ImageTapped.image = img
        
    // Do any additional setup after loading the view.
    }
    


}
