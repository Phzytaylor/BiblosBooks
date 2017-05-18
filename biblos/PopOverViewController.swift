//
//  PopOverViewController.swift
//  biblos
//
//  Created by Taylor FIckle Simpson on 7/26/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController {

    @IBOutlet weak var myTextView: UITextView!
    @IBAction func backToHome(_ sender: AnyObject) {
        
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)

        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let rtfPath = Bundle.main.url(forResource: "Terms_of_Use", withExtension: "rtf") {
            do {
                let attributedStringWithRtf = try NSAttributedString(url: rtfPath, options: [NSDocumentTypeDocumentAttribute:NSRTFTextDocumentType], documentAttributes: nil)
                myTextView.attributedText = attributedStringWithRtf
            } catch {
                print("No rtf content found!")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
