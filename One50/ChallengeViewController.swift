//
//  ChallengeViewController.swift
//  One50
//
//  Created by MAC BOOK on 22/06/18.
//  Copyright © 2018 MAC BOOK. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate
{
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg"]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
       cell.Images.image = UIImage(named: items[indexPath.row])
       // cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
       
        return cell
    }


    override func viewDidLoad()
    {
        super.viewDidLoad()
       
    }

   
}


