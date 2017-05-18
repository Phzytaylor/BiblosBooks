//
//  ChatMessageCell.swift
//  biblos
//
//  Created by Taylor FIckle Simpson on 7/14/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit

class ChatMessageCell: UICollectionViewCell {
    
    
    let textView: UITextView = {
    
    let tv = UITextView()
        
        tv.text = "TREE"
        
        tv.font = UIFont.systemFont(ofSize: 16)
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        tv.backgroundColor = UIColor.clear
        
        tv.textColor = .white
        
        return tv
    
    
    
    }()
    
    
    static let blueColor = UIColor(red: 0, green: 137, blue: 249, alpha: 1.0)
    
    let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = blueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    
 
    let profileImageView: UIImageView = {
    
    
        let imageView = UIImageView()
        
        imageView.image = UIImage(named:"nedstark")
    
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        
        imageView.layer.masksToBounds = true
        
        imageView.contentMode = .scaleAspectFit
    
    return imageView
    }()
    
    
    
    var bubbleWidthAnchor: NSLayoutConstraint?
    var bubbleViewRightAnchor: NSLayoutConstraint?
    var bubbleViewLeftAnchor: NSLayoutConstraint?
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bubbleView)
       
        addSubview(textView)
        
        addSubview(profileImageView)
        
        
        
        //x,y,w,h
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true

        
        
        //x,y,w,h
        bubbleViewRightAnchor = bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
        
        bubbleViewRightAnchor?.isActive = true
        
        bubbleViewLeftAnchor = bubbleView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8)
        
        
        bubbleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
   
        
        
        //////////////////////////////
        bubbleWidthAnchor = bubbleView.widthAnchor.constraint(equalToConstant: 200)
        bubbleWidthAnchor?.isActive = true
        
        bubbleView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        ///SenderBubbleStuff
        
       // senderBubbleWidthAnchor = heWhoMessaged.widthAnchor.constraintEqualToConstant(200)
        //senderBubbleWidthAnchor?.active = true
        
        //heWhoMessaged.heightAnchor.constraintEqualToAnchor(self.heightAnchor).active = true
        
        
        
        ///////////
        
        
        
        
        //ios 9 constraints
        //x,y,w,h
        //        textView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
        textView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        textView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor).isActive = true
        //        textView.widthAnchor.constraintEqualToConstant(200).active = true
        
        
        textView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
