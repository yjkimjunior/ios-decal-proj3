//
//  SecondViewController.swift
//  Photos
//
//  Created by Young Joong Kim on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dImageView: UIImageView!
    
    var photoToShow = PhotosCollectionViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhotosCollectionViewController.loadImageForCell(PhotosCollectionViewController.photos)
    }
    
    
    

}
