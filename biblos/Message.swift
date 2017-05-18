//
//  Message.swift
//  gameofchats
//
//  Created by Brian Voong on 7/7/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit
import Firebase

class Message: NSObject {
    
    var fromId: String?
    var text: String?
    var timestamp: NSNumber?
    var toId: String?
    var toPushingID: String?
    var fromPushingID: String?
    
   
    
    
    func chatPartnerId() -> String? {
    
       if fromId == FIRAuth.auth()?.currentUser?.uid {
            return toId
        } else {
           return fromId
        }
    
    
    
    }
    
}

