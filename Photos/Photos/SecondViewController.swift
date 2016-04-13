//
//  SecondViewController.swift
//  Photos
//
//  Created by Young Joong Kim on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var photo:Photo!
    var likesCount:Int = 0
    
    @IBOutlet weak var dImageView: UIImageView!
    
    @IBOutlet weak var dUserNameLabel: UILabel!
    
    @IBOutlet weak var dDateLabel: UILabel!
    
    @IBOutlet weak var dLikesLabel: UILabel!
    
    @IBAction func heartButton(sender: AnyObject) {
        likesCount += 1
        dLikesLabel.text = String(likesCount)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = NSData(contentsOfURL: NSURL(string: photo.url)!)
        
        var image : UIImage?
        if data != nil {
            photo.imageData = data
            image = UIImage(data: data!)!
        }
        
        likesCount = photo.likes
        
        dImageView.image = image
        
        dUserNameLabel.text = photo.username
        dDateLabel.text = "Added: " + photo.date
        dLikesLabel.text = "Likes: " + String(photo.likes)

    }
}
