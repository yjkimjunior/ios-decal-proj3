//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    
    private let reuseIdentifier = "InstaCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

    @IBOutlet var photosCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        
        
        photos = [Photo]()
        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)

    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    override func collectionView(collectionView: UICollectionView,
                          numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(collectionView: UICollectionView,
                                   cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = photosCollectionView.dequeueReusableCellWithReuseIdentifier("InstaCell", forIndexPath: indexPath) as! InstaCollectionViewCell
        
        let photo = photos[indexPath.row]
        cell.userNameLabel.text = photo.username
        cell.dateLabel.text = photo.date
        cell.likesLabel.text = String(photo.likes)
        loadImageForCell(photo, imageView: cell.imageViewLabel)
        return cell
    }
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        
        let queue = dispatch_queue_create("com.pikapi.photos", nil)
        
        dispatch_async(queue) {
            let data = NSData(contentsOfURL: NSURL(string: photo.url)!)
            
            var image : UIImage?
            if data != nil {
                photo.imageData = data
                image = UIImage(data: data!)!
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }

}
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.photosCollectionView!.reloadData()
    }
    
}

