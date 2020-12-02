//
//  ViewController.swift
//  Mission_ImageView
//
//  Created by 김소진 on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {
    
    var maxImage = 6
    var numImage = 1

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btnBeforImage(_ sender: UIButton) {
        numImage = numImage - 1

        if (numImage < 1) {
            numImage = maxImage
        }
        
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
    }
    
    @IBAction func btnAfterImage(_ sender: UIButton) {
        numImage = numImage + 1
        
        if (numImage > maxImage) {
            numImage = 1
        }
        
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
    }
    
    
}

