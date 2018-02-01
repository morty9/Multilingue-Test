//
//  ViewController.swift
//  Multilingue-Test
//
//  Created by Bérangère La Touche on 21/01/2018.
//  Copyright © 2018 Bérangère La Touche. All rights reserved.
//

import UIKit
import SwitchLanguage

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var actionSheet: UIAlertController!
    
    let avL = Language.getAllLanguages()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(avL)
        self.setText()
    }
    
    @objc func setText() {
        label.text = "Hello World".localized(using: "Localizable")
        button.setTitle("Change".localized(using: "Localizable"), for: UIControlState.normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    // Remove the LCLLanguageChangeNotification on viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func doChangeLanguage(_ sender: AnyObject) {
        actionSheet = Language.flagAlert(avL)
        //actionSheet = Language.basicAlert(avL)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

