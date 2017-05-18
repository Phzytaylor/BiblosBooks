//
//  TestViewController.swift
//  biblos
//
//  Created by Taylor Simpson on 3/3/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    var modelName = UIDevice.current.modelName
    
    
    
    lazy var profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "old-books-436498_640.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        
        
        //imageView.contentMode = .scaleAspectFill
        
        
        
        return imageView
        
        
    }()
    
    
    
   
    
    
    
    
    func setupProfileImageView() {
        
        
        
        let myDevice = Devices.IPhone7Plus
        
        if myDevice == Devices.IPhone7Plus{
            
            //need x, y, width, height constraints
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-250).isActive = true
            
            
            profileImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
            profileImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
            
            
           //self.profileImageView.layer.frame = profileImageView.layer.frame.insetBy(dx: 0, dy: 0)
            
            
        }
        
        
        
        
        if myDevice == Devices.IPhone5{
            
            
            //need x, y, width, height constraints
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-200).isActive = true
            
            
            profileImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
            profileImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
            
        }
        
        
        
        
        
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(profileImageView)
        
        setupProfileImageView()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




