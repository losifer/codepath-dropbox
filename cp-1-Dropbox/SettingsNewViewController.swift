//
//  SettingsNewViewController.swift
//  cp-1-Dropbox
//
//  Created by Sebastian Drew on 9/20/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class SettingsNewViewController: UIViewController {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsScrollView.contentSize = settingsImage.image!.size
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        settingsScrollView.contentInset.top = 0
        settingsScrollView.contentInset.bottom = 50
        settingsScrollView.scrollIndicatorInsets.top = 0
        settingsScrollView.scrollIndicatorInsets.bottom = 50
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
