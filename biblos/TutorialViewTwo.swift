//
//  TutorialViewTwo.swift
//  biblos
//
//  Created by Taylor Simpson on 3/6/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import Foundation
import UIKit
import BWWalkthrough





class TutorialViewTwo: BWWalkthroughPageViewController{

   

    //This is for the arrow!
    //Left Down.png
    
    
    
    lazy var backGroundView: UIImageView = {
        
        let backGround = UIImageView()
        
        
        if modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone6Plus || modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other {
            
            backGround.image = UIImage(named: "resultsPic.PNG")
        }
        
        if modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7 || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C{
            
            
            backGround.image = UIImage(named: "book4s.png")
            
            
            
        }
        
        
        backGround.translatesAutoresizingMaskIntoConstraints = false
        
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2{
        
            backGround.contentMode = .scaleAspectFit
        
        
        }
        
        else{
            backGround.contentMode = .scaleAspectFill
        
        }
        
        
        
        return backGround
        
        
    }()
    
    
    func setupBackgroundView(){
        
        
        backGroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backGroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        backGroundView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        
        
    }

    lazy var cellArrow: UIButton = {
    
        let myButt = UIButton()
        
        
        
        myButt.setImage(UIImage(named:"Left Up 2_293f7c_100.png"), for: .normal)
        
        
        myButt.translatesAutoresizingMaskIntoConstraints = false
        
        return myButt
        
        
    
    
    }()
    
    
    func setupCellArrow(){
    
        if modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone6Plus {
        
        cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -75).isActive = true
        cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -90).isActive = true
        
        cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        
        
        
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhoneSE || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7 || modelName == Devices.IPhone5C{
            
            cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -90).isActive = true
            
            cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -55).isActive = true
            
            
            cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
        
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other {
            
            cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -75).isActive = true
            cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120).isActive = true
            
            cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true

        
        
        }
    
    
    
    }
    
    
    
    
    lazy var instructionBox: UIButton = {
        
        let box = UIButton()
        
        
        box.translatesAutoresizingMaskIntoConstraints = false
        
        box.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        box.setTitle("Click For Info", for: .normal)
        
        box.setTitleColor(.white, for: .normal)
        
        return box
        
        
    }()
    
    
    
    func setupInstructionBox(){
        
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7 || modelName == Devices.IPhone7Plus || modelName == Devices.IPhoneSE || modelName == Devices.IPhone7 || modelName == Devices.IPhone5C || modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
            
            instructionBox.leftAnchor.constraint(equalTo: cellArrow.rightAnchor).isActive = true
            instructionBox.centerYAnchor.constraint(equalTo: cellArrow.centerYAnchor, constant: 20).isActive = true
            
            instructionBox.widthAnchor.constraint(equalToConstant: 190).isActive = true
            instructionBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        
    }
    
    

    override func viewDidLoad() {
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other {
        
        
            view.backgroundColor = .black
        }
        
        
        view.addSubview(backGroundView)
        
        setupBackgroundView()
        
        
        view.addSubview(cellArrow)
        
        setupCellArrow()
        
        
        view.addSubview(instructionBox)
        
        
        setupInstructionBox()
        
        
    }




}
