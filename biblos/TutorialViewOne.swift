//
//  TutorialViewOne.swift
//  biblos
//
//  Created by Taylor Simpson on 3/4/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import UIKit
import BWWalkthrough

var modelName = UIDevice.current.modelName

//var modelName = Devices.IPhoneSE

class TutorialViewOne: BWWalkthroughPageViewController{


    
    lazy var backGroundView: UIImageView = {
    
    let backGround = UIImageView()
        
        
        if modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone6Plus || modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 {
        
        backGround.image = UIImage(named: "Simulator Screen Shot Mar 1, 2017, 1.50.42 PM.png")
        }
        
        if modelName == Devices.Other{
        
        backGround.image = UIImage(named: "Simulator Screen Shot Mar 1, 2017, 1.50.42 PM.png")
        
        
        }
        
        
        if modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7 || modelName == Devices.IPhoneSE{
           
            
            backGround.image = UIImage(named: "Genres4s")
            
        
        
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
    
    lazy var leftButton: UIButton = {
    
    
    let leftButt = UIButton()
        
        leftButt.setBackgroundImage(UIImage(named: "Left Down.png") as UIImage?, for: .normal)
        
        
        leftButt.translatesAutoresizingMaskIntoConstraints = false
        
        
        return leftButt
    
        
    }()
    
    func setupLeftArrow (){
    
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C{
        
        leftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -120).isActive = true
        
        leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 190).isActive = true
        
        
        leftButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        leftButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
        
        if modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7{
            
            
            leftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -135).isActive = true
            
            leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 220).isActive = true
            
            
            leftButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            leftButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

            
        
        
        
        }
        
        
        
        if modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7Plus{
        
        
            leftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -150).isActive = true
            
            leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 270).isActive = true
            
            
            leftButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            leftButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

            
        
        }
        
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2{
        
        
            leftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -210).isActive = true
            
            leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 390).isActive = true
            
            
            leftButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            leftButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
            

            
            
        }
        
        if modelName == Devices.Other{
        
        
        
            leftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -150).isActive = true
            
            leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 270).isActive = true
            
            
            leftButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            leftButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
        }
    
    
    
    }
    
    
    lazy var instructionBoxTwo: UIButton = {
    
        let boxTwo = UIButton()
        
        
        boxTwo.translatesAutoresizingMaskIntoConstraints = false
        
        boxTwo.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        boxTwo.setTitle("Find Books By Genre", for: .normal)
        
        boxTwo.setTitleColor(.white, for: .normal)
    
    return boxTwo
    
    
    }()
    
    
    
    func setupInstructionBoxTwo(){
    
        if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7 || modelName == Devices.IPhone7Plus || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C || modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
        
        instructionBoxTwo.leftAnchor.constraint(equalTo: leftButton.rightAnchor).isActive = true
        instructionBoxTwo.centerYAnchor.constraint(equalTo: leftButton.centerYAnchor, constant: -10).isActive = true
        
        instructionBoxTwo.widthAnchor.constraint(equalToConstant: 190).isActive = true
        instructionBoxTwo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
    
    }
    
    
    lazy var upArrow: UIButton = {
    
    
        let myUpArrow = UIButton()
        
        myUpArrow.translatesAutoresizingMaskIntoConstraints = false
        
        myUpArrow.setBackgroundImage(UIImage(named: "Left Up 2_293f7c_100.png") as UIImage?, for: .normal)
        
        
        return myUpArrow
        
    }()
    
    
    
    func setupUpArrow(){
    
     if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C{
        
        upArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        
        upArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -190).isActive = true
        
        upArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        upArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        }
        
        
        if modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7{
            
            
            upArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -130).isActive = true
            
            upArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -220).isActive = true
            
            upArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            upArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            
        }
        
        if modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7Plus{
        
            upArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -160).isActive = true
            
            upArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -265).isActive = true
            
            upArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            upArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        }
        
        
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
        
        
            upArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -160).isActive = true
            
            upArrow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -400).isActive = true
            
            upArrow.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            upArrow.heightAnchor.constraint(equalToConstant: 80).isActive = true

        
        }
        
    }
    
    lazy var infoBoxOne: UIButton = {
    
    
    let boxOne = UIButton()
        
        boxOne.translatesAutoresizingMaskIntoConstraints = false
        
        boxOne.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        boxOne.setTitle("Look Up Genres", for: .normal)
        
        boxOne.setTitleColor(.white, for: .normal)

        
        
        return boxOne
    
        
    }()
    
    
    func setupInfoBoxOne () {
    
         if  modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7Plus || modelName == Devices.IPhone7 || modelName == Devices.IPhoneSE || modelName == Devices.IPhone5C || modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other {
    
        
        infoBoxOne.leftAnchor.constraint(equalTo: upArrow.rightAnchor).isActive = true
         infoBoxOne.centerYAnchor.constraint(equalTo: upArrow.centerYAnchor, constant: 10).isActive = true
        
         infoBoxOne.widthAnchor.constraint(equalToConstant: 190).isActive = true
         infoBoxOne.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    
    
    
    }
    
    
    lazy var centerButton: UIButton = {
    
        let centerButt = UIButton()
        
        centerButt.translatesAutoresizingMaskIntoConstraints = false
        
        centerButt.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        centerButt.setTitle("Tap A Genre", for: .normal)
        
        centerButt.setTitleColor(.white, for: .normal)
        
        return centerButt
        
    
    }()
    
    
    
    func setupCenterButton(){
    
        centerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        centerButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        centerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    
    }

    override func viewDidLoad() {
        
       
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 {
            view.backgroundColor = .black
        
        
        }
        
        view.addSubview(backGroundView)
        
        setupBackgroundView()
        
        view.addSubview(leftButton)
        
        
        setupLeftArrow()
        
        
        view.addSubview(instructionBoxTwo)
        setupInstructionBoxTwo()
        
        
        
        view.addSubview(upArrow)
        
        setupUpArrow()
        
        view.addSubview(infoBoxOne)
        
        setupInfoBoxOne()
        
        
        view.addSubview(centerButton)
        
        setupCenterButton()
        
        
    }






}
