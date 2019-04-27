//
//  ViewController.swift
//  Multilanguage
//
//  Created by Eric JI on 2019/04/26.
//  Copyright © 2019 Eric JI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyboardLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        codeLabel.text = "hello".localize
   
    }

    @IBAction func changeLanguage(_ sender: Any) {
        
        let sheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        let enAction = UIAlertAction(title: "english".localize, style: .default) { (_) in
            setCurrent(index: 0)
        }
        let jpAction = UIAlertAction(title: "japanese".localize, style: .default) { (_) in
            setCurrent(index: 1)
        }
        let zhAction = UIAlertAction(title: "chinese".localize, style: .default) { (_) in
            setCurrent(index: 2)
        }
        
        sheetVC.addAction(enAction)
        sheetVC.addAction(jpAction)
        sheetVC.addAction(zhAction)
        self.present(sheetVC, animated: true, completion: nil)
    }
    
    
    
}

