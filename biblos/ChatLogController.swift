
//
//  ChatLogController.swift
//
//
//  Created by Taylor FIckle Simpson on 7/10/16.
//
//


import UIKit
import Firebase
import FirebaseMessaging
import DZNEmptyDataSet

class ChatLogController: UICollectionViewController, UITextFieldDelegate, UICollectionViewDelegateFlowLayout, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    
    //This var is for email users
    var userName: String!
    var userNameForPush: String!
    
    var theUserPushed: String!
    
    //This is to Identify the current users pushingID
    var currentLogedInUserPushId: String?
    
    
    
    
    var user:User!{
    
        didSet{
        
        
            navigationItem.title = "chatting with \(user!.name!)"
            
            
           
            
            observeMessages()
            
           
        
        }
    
    
    
    }
    
    var messages = [Message]()
    
    //This is from the moreInfo Controller
    
    var pushToUser: String!
    
    
    var willPush: String!
    
    var whenNil: String!
    
    func observeMessages(){
    
        guard let uid = FIRAuth.auth()?.currentUser?.uid, let toId = user?.id else{
        
            return
        
        }
        
        let userMessagesRef =
        FIRDatabase.database().reference().child("user-messages").child(uid).child(toId)
        
        
        userMessagesRef.observe(.childAdded, with: { (snapshot) in
            
            
            let messageId = snapshot.key
            
            let messagesRef = FIRDatabase.database().reference().child("messages").child(messageId)
            
            
            messagesRef.observe(.value, with: { (snapshot) in
                
                guard let dictionary = snapshot.value as? [String: AnyObject] else{
                
                
                    return
                
                }
                
                let message = Message()
                
                //if keys don't match it will crash man
                
                message.setValuesForKeys(dictionary)
                
               
                
                
                if message.chatPartnerId() == self.user?.id {
                    self.messages.append(message)
                    
                    
                    
                    if message.chatPartnerId() != FIRAuth.auth()?.currentUser?.uid{
                    
                    
                        
                        if message.toPushingID != self.currentLogedInUserPushId {
                        //This user will be pushed
                        self.willPush = message.toPushingID
                            
                            
                    
                    print("THIS is the user who will be pushed\(self.willPush)")
                        }
                        
                        
                        if message.toPushingID == self.currentLogedInUserPushId {
                        
                            self.willPush = message.fromPushingID
                        
                        
                        }
                    
                    }
                    
                    
                    
                   // print(self.willPush, "this is evil!")
                    
                    print("This is the person I am talking to id , \(message.chatPartnerId())","THIS IS MY ID \(FIRAuth.auth()?.currentUser?.uid as String!)")
                    
                    DispatchQueue.main.async(execute: {
                        self.collectionView?.reloadData()
                    })
                }
                
                
                
                }, withCancel: nil)
            
            
            
            }, withCancel: nil)
    
        
    
    }
    
    var toID: String?
    var FromID = FIRAuth.auth()?.currentUser?.uid
    
    lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter message..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    let cellId = "cellId"
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
     UIApplication.shared.statusBarStyle = .lightContent
       
        
        navigationController!.navigationBar.barTintColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        self.navigationController!.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        
        
        
       // navigationItem.title = "Now chatting with \(nameThing as String!)"
        
        OneSignal.idsAvailable({ (userId, pushToken) in
            self.currentLogedInUserPushId = userId
            if (pushToken != nil) {
                NSLog("pushToken:%@", pushToken ?? "")
            }
        })

        
        let userNameForPush = FIRAuth.auth()?.currentUser?.uid as String!
        
        let userNameForPushName = FIRDatabase.database().reference().child("users").child(userNameForPush!).child("name")
        
        
       
        userNameForPushName.observeSingleEvent(of: .value, with: { (snapshot) in
            
            self.userName = snapshot.value as! String!
            
            }, withCancel: nil)
        
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 58, right: 0)
       // collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        
        
        
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ChatMessageCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.keyboardDismissMode = .interactive
       
        
        //setupInputComponents()
    }
    
    
    lazy var inputContainerView: UIView = {
    
    
        let containerView = UIView()
        containerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        containerView.backgroundColor = UIColor.white
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: UIControlState())
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        containerView.addSubview(sendButton)
        //x,y,w,h
        sendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        containerView.addSubview(self.inputTextField)
        //x,y,w,h
        self.inputTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        self.inputTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        self.inputTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor).isActive = true
        self.inputTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor.darkGray
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(separatorLineView)
        //x,y,w,h
        separatorLineView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separatorLineView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        separatorLineView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        return containerView

    
    
    
    }()
    
    
    override var inputAccessoryView: UIView?{
    
        get{
        
                return inputContainerView
        
        }
    
    }
    
    override var canBecomeFirstResponder : Bool {
        return true
        
    }
    
    
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    func handleKeyboardWillShow(_ notification: Notification) {
        let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        containerViewBottomAnchor?.constant = -keyboardFrame!.height
        UIView.animate(withDuration: keyboardDuration!, animations: {
            self.view.layoutIfNeeded()
        }) 
    }
    
    func handleKeyboardWillHide(_ notification: Notification) {
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        containerViewBottomAnchor?.constant = 0
        UIView.animate(withDuration: keyboardDuration!, animations: {
            self.view.layoutIfNeeded()
        }) 
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatMessageCell
        
        let message = messages[indexPath.item]
        cell.textView.text = message.text
        
           setupCell(cell, message: message)
        
        
        //lets modify the bubbleView's width somehow???
        
        
        
        cell.bubbleWidthAnchor?.constant = estimateFrameForText(message.text!).width + 32
        
       

        
        
        return cell
    }
    
    
    
    fileprivate func setupCell(_ cell: ChatMessageCell, message: Message){
    
    
        if let profileImageUrl = self.user?.profileImageUrl{
        
            cell.profileImageView.loadImageUsingCacheWithUrlString(profileImageUrl)
        
        }
    
        if message.fromId == FIRAuth.auth()?.currentUser?.uid{
        
            //outgoing blue
            cell.bubbleView.backgroundColor = UIColor(red: 0.1216, green: 0.8275, blue: 0, alpha: 1.0)
            cell.textView.textColor = UIColor.white
            
            cell.profileImageView.isHidden = true
            
            cell.bubbleViewRightAnchor?.isActive = true
            cell.bubbleViewLeftAnchor?.isActive = false
        
        
        }else {
        
        
            //incoming gray
            
            cell.bubbleView.backgroundColor = UIColor(red: 0.8, green: 0.8039, blue: 0.8196, alpha: 1.0)
            cell.textView.textColor = UIColor.black
            
            cell.profileImageView.isHidden = false
            
            cell.bubbleViewRightAnchor?.isActive = false
            
            cell.bubbleViewLeftAnchor?.isActive = true
        
        
        
        }
    
    
    
    
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
  
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        var height: CGFloat = 80
        
        
        //get estimated height somehow????
        if let text = messages[indexPath.item].text {
            height = estimateFrameForText(text).height + 20
        }
        
        let width = UIScreen.main.bounds.width
        
        return CGSize(width: width, height: height)
        
        
    }
    
    fileprivate func estimateFrameForText(_ text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
    
    
    var containerViewBottomAnchor: NSLayoutConstraint?
    
    func setupInputComponents() {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        //ios9 constraint anchors
        //x,y,w,h
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: UIControlState())
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        containerView.addSubview(sendButton)
        //x,y,w,h
        sendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        containerView.addSubview(inputTextField)
        //x,y,w,h
        inputTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        inputTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor).isActive = true
        inputTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor.darkGray
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(separatorLineView)
        //x,y,w,h
        separatorLineView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separatorLineView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        separatorLineView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func handleSend() {
        let ref = FIRDatabase.database().reference().child("messages")
        let childRef = ref.childByAutoId()
        //is it there best thing to include the name inside of the message node
        
      
        
        
        
        let toId = user!.id!
        
        
        if toId != FIRAuth.auth()?.currentUser?.uid{
        
            if pushToUser != nil {
            
                
                
                if FIRAuth.auth()?.currentUser?.displayName as String! == nil {
                
                
                    userNameForPush = userName
                
                
                }
                
                else{
                    userNameForPush = FIRAuth.auth()?.currentUser?.displayName as String!
                
                }
                
                OneSignal.postNotification(["headings":["en":"New Message"],"contents": ["en": "You have a new mesage from \(userNameForPush as String!) 📚📚"],"include_player_ids": ["\(pushToUser as String!)"], "ios_badgeType":"Increase", "ios_badgeCount":1])
                print(pushToUser, "THIS IS PUSHTOUSER")
                print(" I AM WORKING")
            
            
            }
            
            
            
            if pushToUser == nil{
                
                
                
                if FIRAuth.auth()?.currentUser?.displayName as String! == nil {
                    
                    
                    userNameForPush = userName
                    
                    
                }
                    
                else{
                    userNameForPush = FIRAuth.auth()?.currentUser?.displayName as String!
                    
                }
                
                OneSignal.postNotification(["headings":["en":"New Message"],"contents": ["en": "You have a new mesage from \(userNameForPush as String!) 📚📚"],"include_player_ids": ["\(willPush as String!)"], "ios_badgeType":"Increase", "ios_badgeCount":1])
                
                //print(willPush,"This is Will PUSH!")
                
                print(" I AM WORKING TOO")
            
            
            
            }
        
        }
        
        
       
       
       // let message = Message()

        
        let fromId = FIRAuth.auth()!.currentUser!.uid
        //let timestamp: NSNumber = NSNumber(Int(Date().timeIntervalSince1970))
        let timestamp: NSNumber = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        
        
        
        
        if pushToUser != nil {
        
            self.theUserPushed = pushToUser
        
        
        }
        else if pushToUser == nil {
        
        
            self.theUserPushed = willPush
        
        
        }
        
        
        
        let values = ["text": inputTextField.text!, "toId": toId, "fromId": fromId, "timestamp": timestamp, "toPushingID": theUserPushed, "fromPushingID": currentLogedInUserPushId as String!  ] as [String : Any]
        //        childRef.updateChildValues(values)
        
        
        if self.inputTextField.text == ""{
            
            let alert = UIAlertController(title: "No Text detected", message: "You cannot send a blank message", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
            
            
        }else{
        
        childRef.updateChildValues(values) { (error, ref) in
            if error != nil {
                print(error)
                return
            }
            
            self.inputTextField.text = nil
            
         
            
            let userMessagesRef = FIRDatabase.database().reference().child("user-messages").child(fromId).child(toId)
            
            
         
            
            let messageId = childRef.key
            
          
            
            
            userMessagesRef.updateChildValues([messageId: 1])
            
            let recipientUserMessagesRef = FIRDatabase.database().reference().child("user-messages").child(toId).child(fromId)
                recipientUserMessagesRef.updateChildValues([messageId: 1])}
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleSend()
        return true
    }
    }
}
