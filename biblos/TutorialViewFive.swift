//
//  TutorialViewFive.swift
//  biblos
//
//  Created by Taylor Simpson on 3/9/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import Foundation
import UIKit
import BWWalkthrough

class TutorialViewFive: BWWalkthroughPageViewController {
    
    //Upload Your Books
    
    //Fill out the info and add a picure
    
    
   
    
    
    
    
    lazy var backGroundView: UIImageView = {
        
        let backGround = UIImageView()
        
        
        if modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone6Plus || modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other {
            
            backGround.image = UIImage(named: "Simulator Screen Shot Mar 1, 2017, 1.58.02 PM.png")
        }
        
        if modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7 || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C{
            
            
            backGround.image = UIImage(named: "upload4s.png")
            
            
            
        }
        
        
        backGround.translatesAutoresizingMaskIntoConstraints = false
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
        
            backGround.contentMode = .scaleAspectFit
        }else{
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
        
        
        
        myButt.setImage(UIImage(named:"Down Right White.png"), for: .normal)
        
        
        myButt.translatesAutoresizingMaskIntoConstraints = false
        
        return myButt
        
        
        
        
    }()
    
    
    func setupCellArrow(){
        
        if modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone6Plus {
            
            cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -55).isActive = true
            cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 320).isActive = true
            
            cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        
        
        
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C{
            
            cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -50).isActive = true
            
            cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 240).isActive = true
            
            
            cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
        
        
        
        if modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7{
        
        
            cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -50).isActive = true
            
            cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 280).isActive = true
            
            
            cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        }
        
       if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
        
        cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -55).isActive = true
        cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 450).isActive = true
        
        cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        }
        
        
    }
    
    
    
    
    lazy var instructionBox: UIButton = {
        
        let box = UIButton()
        
        
        box.translatesAutoresizingMaskIntoConstraints = false
        
        box.backgroundColor = .white
        box.setTitle("Upload Your Books", for: .normal)
        
        box.setTitleColor(UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
, for: .normal)
        
        return box
        
        
    }()
    
    
    
    func setupInstructionBox(){
        
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7 || modelName == Devices.IPhone7Plus || modelName == Devices.IPhoneSE || modelName == Devices.IPhone7 || modelName == Devices.IPhone5C || modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
            
            instructionBox.centerXAnchor.constraint(equalTo: cellArrow.centerXAnchor).isActive = true
            instructionBox.centerYAnchor.constraint(equalTo: cellArrow.centerYAnchor, constant: -70).isActive = true
            
            instructionBox.widthAnchor.constraint(equalToConstant: 190).isActive = true
            instructionBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        
    }
    
    
    
    
    
    lazy var infoBoxOne: UIButton = {
        
        
        let boxOne = UIButton()
        
        boxOne.translatesAutoresizingMaskIntoConstraints = false
        
        boxOne.backgroundColor = .white
        boxOne.setTitle("Fill out the info and add a picure", for: .normal)
        
        boxOne.setTitleColor(UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
, for: .normal)
        
        
        
        return boxOne
        
        
    }()
    
    
    func setupInfoBoxOne () {
        
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7Plus || modelName == Devices.IPhone7 || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C || modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
            
            
            infoBoxOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            infoBoxOne.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
            
            infoBoxOne.widthAnchor.constraint(equalToConstant: 280).isActive = true
            infoBoxOne.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        
        
    }
    

    
    
    
    override func viewDidLoad() {
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
        
        
            view.backgroundColor = .black
        
        }
        
        view.addSubview(backGroundView)
        
        setupBackgroundView()
        
        
        view.addSubview(cellArrow)
        
        setupCellArrow()
        
        
        view.addSubview(instructionBox)
        
        
        setupInstructionBox()
        
        
        view.addSubview(infoBoxOne)
        
        setupInfoBoxOne()
        
        
    }
    
}
