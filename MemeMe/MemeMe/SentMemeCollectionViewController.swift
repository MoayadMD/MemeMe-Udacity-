//
//  SentMemeCollectionViewController.swift
//  MEME
//
//  Created by Moayad Makhdom on 19/08/1440 AH.
//  Copyright © 1440 Moayad Makhdom. All rights reserved.
//

import Foundation
import UIKit

class SentMemeCollectionViewController : UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimensionW = (view.frame.size.width - (2 * space)) / 3.0
        
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimensionW, height: dimensionW)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        let rightBarButtonToAddMeme = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(SentMemeTableViewVontroller.addNewMeme))
        navigationItem.title = "Sent Memes"
        navigationItem.setRightBarButton(rightBarButtonToAddMeme, animated: true)
        
        collectionView.reloadData()
    }
    
    @objc func addNewMeme(){
        let newMemeController = storyboard?.instantiateViewController(withIdentifier: "EditorViewController") as! EditorViewController
        
        present(newMemeController, animated: true, completion: nil)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCollectionCell", for: indexPath) as! MemeCollectionCell
        
        cell.collectionImageView?.image = memes[indexPath.row].memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memeDetailViewController = storyboard?.instantiateViewController(withIdentifier: "MemeDetail") as! MemeDetail
        
        memeDetailViewController.meme = memes[indexPath.row]
        navigationController?.pushViewController(memeDetailViewController, animated: true)
    }
    
    
    
    
    
    
    
}
