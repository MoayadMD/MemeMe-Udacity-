//
//  MemeDetail.swift
//  MemeMe
//
//  Created by Moayad Makhdom on 20/08/1440 AH.
//  Copyright © 1440 Moayad Makhdom. All rights reserved.
//

import Foundation
import UIKit

class MemeDetail : UIViewController {
    
    var meme : Meme!
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = meme.memedImage
    }
    
    
    
    
}
