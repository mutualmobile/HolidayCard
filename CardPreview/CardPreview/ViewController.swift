//
//  ViewController.swift
//  CardPreview
//
//  Created by Conrad Stoll on 12/7/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

import UIKit
import CardBuilder

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView : UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = Card()

        // Sometimes, you need a debugger. For that, there's CardPreview.
    }
}

