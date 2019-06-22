//
//  SentMemeTableViewController.swift
//  MEME
//
//  Created by Moayad Makhdom on 19/08/1440 AH.
//  Copyright © 1440 Moayad Makhdom. All rights reserved.
//

import Foundation
import UIKit

class SentMemeTableViewVontroller : UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        let rightBarButtonToAddMeme = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(SentMemeTableViewVontroller.addNewMeme))
        navigationItem.title = "Sent Memes"
        navigationItem.setRightBarButton(rightBarButtonToAddMeme, animated: true)
        
        tableView.reloadData()
    }
    
    @objc func addNewMeme(){
        let newMemeController = storyboard?.instantiateViewController(withIdentifier: "EditorViewController") as! EditorViewController
        
        present(newMemeController, animated: true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 100.0
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeTableCell")!
        cell.imageView?.image = memes[indexPath.row].memedImage
        cell.textLabel?.text = memes[indexPath.row].topText + " ... " + memes[indexPath.row].bottomText
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memeDetailViewController = storyboard?.instantiateViewController(withIdentifier: "MemeDetail") as! MemeDetail
        
        memeDetailViewController.meme = memes[indexPath.row]
        navigationController?.pushViewController(memeDetailViewController, animated: true)
        
        
    }
    
    
    
    
    
    
}
