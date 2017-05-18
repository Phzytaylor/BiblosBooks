//
//  TutorialViewSeven.swift
//  biblos
//
//  Created by Taylor Simpson on 3/10/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import Foundation
import UIKit
import BWWalkthrough

//Tap to View More
//Books Near You


class TutorialViewSeven: BWWalkthroughPageViewController {
    
    
    lazy var backGroundView: UIImageView = {
        
        let backGround = UIImageView()
        
        
        if modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone6Plus || modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other {
            
            backGround.image = UIImage(named: "bookMapAnt.PNG")
        }
        
        if modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7 || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C{
            
            
            backGround.image = UIImage(named: "Map4s.png")
            
            
            
        }
        
        
        backGround.translatesAutoresizingMaskIntoConstraints = false
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
        
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
        
        
        
        myButt.setImage(UIImage(named:"DownRightArrow.png"), for: .normal)
        
        
        myButt.translatesAutoresizingMaskIntoConstraints = false
        
        return myButt
        
        
        
        
    }()
    
    
    func setupCellArrow(){
        
        if modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone6Plus {
            
            cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 110).isActive = true
            cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 320).isActive = true
            
            cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
            cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 170).isActive = true
            cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 450).isActive = true
            
            cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true

        
        
        }
        
        
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C{
            
            cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 70).isActive = true
            
            cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 240).isActive = true
            
            
            cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
        
        
        
        if modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7{
            
            
            cellArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 80).isActive = true
            
            cellArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 280).isActive = true
            
            
            cellArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            cellArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            
        }
        
        
        
    }
    
    
    
    
    lazy var instructionBox: UIButton = {
        
        let box = UIButton()
        
        
        box.translatesAutoresizingMaskIntoConstraints = false
        
        box.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        box.setTitle("Books Near You", for: .normal)
        
        box.setTitleColor(.white
            , for: .normal)
        
        return box
        
        
    }()
    
    
    
    func setupInstructionBox(){
        
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7 || modelName == Devices.IPhone7Plus || modelName == Devices.IPhoneSE || modelName == Devices.IPhone7 || modelName == Devices.IPhone5C ||  modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
            
            instructionBox.centerXAnchor.constraint(equalTo: cellArrow.centerXAnchor, constant: -10).isActive = true
            instructionBox.centerYAnchor.constraint(equalTo: cellArrow.centerYAnchor, constant: -70).isActive = true
            
            instructionBox.widthAnchor.constraint(equalToConstant: 190).isActive = true
            instructionBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        
    }
    
    
    
    
    lazy var upArrow: UIButton = {
        
        
        let myUpArrow = UIButton()
        
        myUpArrow.translatesAutoresizingMaskIntoConstraints = false
        
        myUpArrow.setBackgroundImage(UIImage(named: "Up.png") as UIImage?, for: .normal)
        
        
        return myUpArrow
        
    }()
    
    
    
    func setupUpArrow(){
        
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C{
            
            upArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            upArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
            
            upArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            upArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            
        }
        
        
        if modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7{
            
            
            upArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            upArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60).isActive = true
            
            upArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            upArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            
        }
        
        if modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7Plus{
            
            upArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            upArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-60).isActive = true
            
            upArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            upArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
        
        
        if  modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
        
            upArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            upArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-100).isActive = true
            
            upArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            upArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
    }
    
    
    
    
    lazy var infoBoxOne: UIButton = {
        
        
        let boxOne = UIButton()
        
        boxOne.translatesAutoresizingMaskIntoConstraints = false
        
        boxOne.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        boxOne.setTitle("Tap For Info", for: .normal)
        
        boxOne.setTitleColor(.white
            , for: .normal)
        
        
        
        return boxOne
        
        
    }()
    
    
    func setupInfoBoxOne () {
        
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7Plus || modelName == Devices.IPhone7 || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C  {
            
            
            infoBoxOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            infoBoxOne.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10
                ).isActive = true
            
            infoBoxOne.widthAnchor.constraint(equalToConstant: 180).isActive = true
            infoBoxOne.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
        
        
            
            infoBoxOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            infoBoxOne.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30
                ).isActive = true
            
            infoBoxOne.widthAnchor.constraint(equalToConstant: 180).isActive = true
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
        
        
        view.addSubview(upArrow)
        
        setupUpArrow()
        
    }
    
}
