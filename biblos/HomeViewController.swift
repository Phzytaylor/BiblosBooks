//
//  HomeViewController.swift
//  biblos
//
//  Created by Taylor Simpson on 6/8/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKCoreKit
import FirebaseStorage




let ProfilePicRef = FIRDatabase.database().reference(fromURL: "https://biblos-1.firebaseio.com/userPhototURL")




class HomeViewController: UIViewController, GADBannerViewDelegate {
    
    lazy var aivLoadingSpinner: UIActivityIndicatorView = {
    
   let mySpinner = UIActivityIndicatorView()
        
        
        mySpinner.color = .blue
        
        mySpinner.translatesAutoresizingMaskIntoConstraints = false
        
        return mySpinner
    
    }()

    
    
    func setupMySpinner (){
    
        aivLoadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        aivLoadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        aivLoadingSpinner.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        aivLoadingSpinner.widthAnchor.constraint(equalToConstant: 200).isActive = true
    
    
    }
    
var modelName = UIDevice.current.modelName

   //var modelName = Devices.IPhone6
    
    
    
    lazy var uiimvProfilePic: UIImageView = {
        
        let imageView = UIImageView()
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        
        
        //imageView.contentMode = .scaleAspectFill
        
        
        
        return imageView
        
        
    }()
    
    
    
    
    
    
    
    
    func setupProfileImageView() {
        
        
        
        //let myDevice = Devices.IPhone7Plus
        
        if modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus{
            
            //need x, y, width, height constraints
            uiimvProfilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
            uiimvProfilePic.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-250).isActive = true
            
            
            uiimvProfilePic.widthAnchor.constraint(equalToConstant: 200).isActive = true
            uiimvProfilePic.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            
            //self.profileImageView.layer.frame = profileImageView.layer.frame.insetBy(dx: 0, dy: 0)
            
            
        }
        
        
        
        
        if modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone4 || modelName == Devices.IPhone4S || modelName == Devices.IPhoneSE{
            
            
            //need x, y, width, height constraints
            uiimvProfilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
            uiimvProfilePic.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-200).isActive = true
            
            
            uiimvProfilePic.widthAnchor.constraint(equalToConstant: 130).isActive = true
            uiimvProfilePic.heightAnchor.constraint(equalToConstant: 130).isActive = true
            
        }
        
        
        if modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7 {
        
        
            
            //need x, y, width, height constraints
            uiimvProfilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           
            uiimvProfilePic.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-200).isActive = true
            
            
            uiimvProfilePic.widthAnchor.constraint(equalToConstant: 170).isActive = true
            uiimvProfilePic.heightAnchor.constraint(equalToConstant: 170).isActive = true
        
        
        }
        
        
        
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2{
        
        
            //need x, y, width, height constraints
            uiimvProfilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
            uiimvProfilePic.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-250).isActive = true
            
            
            uiimvProfilePic.widthAnchor.constraint(equalToConstant: 200).isActive = true
            uiimvProfilePic.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            
            //self.profileImageView.layer.frame = profileImageView.layer.frame.insetBy(dx: 0, dy: 0)
            
            

        
        
        
        }
        
        
        if modelName == Devices.Other{
        
            
            //need x, y, width, height constraints
            uiimvProfilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
            uiimvProfilePic.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-250).isActive = true
            
            
            uiimvProfilePic.widthAnchor.constraint(equalToConstant: 200).isActive = true
            uiimvProfilePic.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            
            //self.profileImageView.layer.frame = profileImageView.layer.frame.insetBy(dx: 0, dy: 0)

        
        
        }
        
        
    }
    

    lazy var welcomeLabel: UILabel = {
    
    let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        label.text = "Welcome"
        label.textAlignment = .center
        
        label.textColor = .white
        
        
        
        
        return label
    
    
    
    
    
    }()
    
    func setUpWelcomeLabel(){
    
        welcomeLabel.topAnchor.constraint(equalTo: uiimvProfilePic.bottomAnchor, constant: 20).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    
    
    }
    
    
   /* override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if needWalkthrough {
            self.tutorialButton()
        }
    } */

    
    
    lazy var uilName: UILabel = {
    
        let myNameLabel = UILabel()
        
        myNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        myNameLabel.textColor = .white
        
        return myNameLabel
    
    
    
    }()
    
    
    
    func setUpNameLabel(){
    
        uilName.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20).isActive = true
        uilName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    }
    
 
    lazy var continueButton: UIButton = {
    
        let moveOn = UIButton()
        
        
        
        moveOn.addTarget(self, action: #selector(collectUserPhoto), for: .touchUpInside)
        
         moveOn.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        
        moveOn.translatesAutoresizingMaskIntoConstraints = false
        
        
        moveOn.setTitleColor(UIColor.white, for: UIControlState())
        
        
        
        
        
        
       moveOn.setTitle("Continue", for: UIControlState())
        
       
        
        moveOn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        
        return moveOn
    
    
    }()
    
    
    func setupContinueButton(){
    
        continueButton.topAnchor.constraint(equalTo: uilName.bottomAnchor, constant: 20).isActive = true
       continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 226).isActive = true
        
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        continueButton.layer.cornerRadius = 5

    
    
    
    }
    
    
    lazy var conditionsButton: UIButton = {
    
    
        let conButt = UIButton()
        
        conButt.translatesAutoresizingMaskIntoConstraints = false
        
        conButt.setTitleColor(UIColor.white, for: UIControlState())
        
        
        conButt.setTitle("Terms and Conditions", for: UIControlState())
        
        
        conButt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        conButt.addTarget(self, action: #selector(termsAgreements), for: .touchUpInside)
        
 conButt.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        conButt.setTitleColor(UIColor.white, for: UIControlState())
        
        return conButt
        
    }()
    
    
    func setupConditionsButt(){
    
    
        conditionsButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 20).isActive = true
        conditionsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        conditionsButton.widthAnchor.constraint(equalToConstant: 226).isActive = true
        
       conditionsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        conditionsButton.layer.cornerRadius = 5
        

    
    
    }
    
    
    lazy var myBanner: GADBannerView = {
    
    let myBigBanner = GADBannerView()
        
        
        
        let requests = GADRequest()
        
        
        myBigBanner.adUnitID = "ca-app-pub-5816120790996944/8277953311"
        
        myBigBanner.delegate = self
        
        myBigBanner.rootViewController = self
        
        myBigBanner.load(requests)
        
        
        myBigBanner.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return myBigBanner
    
    
    
    }()
    
    
    func setupMyGoogleAd(){
    
        if modelName == Devices.IPhone6SPlus || modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6Plus{
        
        myBanner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:300).isActive = true
        myBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myBanner.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
            myBanner.heightAnchor.constraint(equalToConstant: 100).isActive = true }
        
        
        if modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7 || modelName == Devices.IPhoneSE{
        
            myBanner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:235).isActive = true
            myBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            myBanner.widthAnchor.constraint(equalToConstant: 320).isActive = true
            
            myBanner.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        
        }
    
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2{
        
        
            myBanner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:435).isActive = true
            myBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            myBanner.widthAnchor.constraint(equalToConstant: 728).isActive = true
            
            myBanner.heightAnchor.constraint(equalToConstant: 90).isActive = true
            

        }
        
        
        if modelName == Devices.Other{
        
            myBanner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:435).isActive = true
            myBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            myBanner.widthAnchor.constraint(equalToConstant: 728).isActive = true
            
            myBanner.heightAnchor.constraint(equalToConstant: 90).isActive = true

        
        
        
        }
    
    }
    
    
    lazy var bookCounter: UILabel = {
    
    
        let booksShared = UILabel()
        
        booksShared.translatesAutoresizingMaskIntoConstraints = false
        
        booksShared.textColor = .white
        
        return booksShared
    
    
    
    }()
    
    
    func setupBookCounter(){
    
        bookCounter.topAnchor.constraint(equalTo: conditionsButton.bottomAnchor, constant: 20).isActive = true
        bookCounter.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    
    }
    
    
    
    //@IBOutlet weak var bookCounter: UILabel!
    var usersPhotoLink:String? {
    
    
        didSet{
        
            
            
            
            print("I AM SET")
        
        
        }
    
    
    
    
    }
    
    let myBackGround: UIImageView = {
    
    
        let theBackImage = UIImageView()
        
        //let myImage = UIImage(named: "IMG_0570.png")
        
        theBackImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        return theBackImage
    
    
    }()
    
    
    
    func setUpBackImageView(){
        
        self.myBackGround.image = UIImage(named: "old-books-436498_640.jpg")
        
        
        
        self.myBackGround.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.myBackGround.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.myBackGround.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        self.myBackGround.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }

    
    
    var userPushID: String = ""
    
    //@IBOutlet weak var continueButton: UIButton!
    
    
    func profilePic(){
    
        
        let imageCache = NSCache<AnyObject, AnyObject>()
         
         let url = URL(string: self.usersPhotoLink as String! )
        
        
        print("THIS IS THE URL", url)
         URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
         
         //download hit an error so lets return out
         if error != nil {
         print("THIS IS THE ERROR",error)
         return
         }
         
         DispatchQueue.main.async(execute: {
         
         if let downloadedImage = UIImage(data: data!) {
         imageCache.setObject(downloadedImage, forKey: self.usersPhotoLink as String! as AnyObject)
            
            print("THIS WORKS?", self.usersPhotoLink as String!)
         
         self.uiimvProfilePic.image = downloadedImage.circleMasked
            
           // 
            
            
          
         }
         })
           //
         
         }).resume()
        
        

    
    }
    
    
   // @IBOutlet weak var myBanner: GADBannerView!
    
    var UsersLoginInforef = FIRDatabase.database().reference(fromURL: "https://biblos-1.firebaseio.com/")
    

    func termsAgreements() {
        
        
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popOverMan") as! PopOverViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)

        
        
    }

    func collectUserPhoto() {
        
        if let providerData = FIRAuth.auth()?.currentUser?.providerData {
            for userInfo in providerData {
                switch userInfo.providerID {
                case "facebook.com":
                    print("user is signed in with facebook")
                    
                    
                    let itemRef = ProfilePicRef.child("\(FIRAuth.auth()?.currentUser?.displayName as String!) \(FIRAuth.auth()?.currentUser?.uid as String!)") // 1
                    
                    
                    
                    
                    
                    
                    let messageItem = [ // 2
                        
                        "userProfilePic": FIRAuth.auth()?.currentUser?.photoURL?.absoluteString as AnyObject!
                    ]
                    
                    
                    
                    itemRef.setValue(messageItem) // 3
                    
                    performSegue(withIdentifier: "showMyTab", sender: AnyObject.self)
                    
                    
                default:
                    print("user is signed in with \(userInfo.providerID)")
                    
                     performSegue(withIdentifier: "showMyTab", sender: AnyObject.self)
                }
            }
        
        }

        
        
        
    }
    
    //MARK:Properties
    
    //@IBOutlet weak var uiimvProfilePic: UIImageView!
    
    
    
    
    
    
    
   // @IBOutlet weak var uilName: UILabel!
    
    
    //MARK: Actions
       
    
    
    
    /*func circularImage(_ photoImageView: UIImageView?)
    {
        photoImageView!.layer.frame = photoImageView!.layer.frame.insetBy(dx: 0, dy: 0)
        photoImageView!.layer.borderColor = UIColor.gray.cgColor
        photoImageView!.layer.cornerRadius = photoImageView!.frame.height/2
        photoImageView!.layer.masksToBounds = false
        photoImageView!.clipsToBounds = true
        photoImageView!.layer.borderWidth = 0.5
        photoImageView!.contentMode = UIViewContentMode.scaleAspectFill
    }
    */
    
    
    
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(uiimvProfilePic)
        
        setupProfileImageView()
       
           view.addSubview(welcomeLabel)
        
        setUpWelcomeLabel()
        
         UIApplication.shared.statusBarStyle = .lightContent
        
        view.addSubview(uilName)
        
        setUpNameLabel()
        
        
        
        view.addSubview(continueButton)
        
        setupContinueButton()
            
            
            view.addSubview(conditionsButton)
        
        setupConditionsButt()
        
        view.addSubview(myBanner)
        
        setupMyGoogleAd()
        
        
        view.addSubview(bookCounter)
        
        setupBookCounter()
        
        view.addSubview(aivLoadingSpinner)
        
        setupMySpinner()
            
            
            
          /*  continueButton.layer.cornerRadius = 5
            continueButton.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)*/
        
            
            //requests.testDevices = [kGADSimulatorID]
            
            OneSignal.idsAvailable({ (userId, pushToken) in
                self.userPushID = userId!
                if (pushToken != nil) {
                    NSLog("pushToken:%@", pushToken ?? "")
                }
            })
            
            
            if let providerData = FIRAuth.auth()?.currentUser?.providerData {
                for userInfo in providerData {
                    switch userInfo.providerID {
                    case "facebook.com":
                        print("user is signed in with facebook")
                    default:
                        uilName.isHidden = true
                    }
                }
            }
            
            
            
            
        
            
            var bookCountRef = FIRDatabase.database().reference().child("books")
            
            bookCountRef.observe(.value, with: { (snapshot) in
                
                print(snapshot.childrenCount)
                
                self.bookCounter.text = "\(snapshot.childrenCount) books shared so far!"
                
            }, withCancel: nil)
            
            
            // Do any additional setup after loading the view.
            
            
            //self.uiimvProfilePic.layer.cornerRadius = self.uiimvProfilePic.frame.size.width/2
            
            
            
            // self.uiimvProfilePic.clipsToBounds = true
            
            
            //circularImage(uiimvProfilePic)
            
            
            
            if let providerData = FIRAuth.auth()?.currentUser?.providerData {
                for userInfo in providerData {
                    switch userInfo.providerID {
                    case "facebook.com":
                        print("user is signed in with facebook")
                        
                        if let user = FIRAuth.auth()?.currentUser {
                            
                            // User is signed in.
                            
                            let name = user.displayName
                            var email = user.email
                            let photoUrl = user.photoURL
                            let uid = user.uid;
                            let PushingID = userPushID
                            
                            
                            self.uilName.text = name
                            
                            
                            print (email)
                            
                            //reference to firebase storage service
                            
                            let storage = FIRStorage.storage()
                            
                            //refer your particular storage service
                            
                            let storageRef = storage.reference(forURL: "gs://biblos-1.appspot.com")
                            
                            let profilePicRef = storageRef.child(user.uid+"/profile_pic.jpg")
                            
                            
                            
                            
                            
                            
                            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
                            profilePicRef.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                                if (error != nil) {
                                    // Uh-oh, an error occurred!
                                    
                                    print("Unable to download image")
                                    
                                } else {
                                    
                                    
                                    if(data != nil){
                                        
                                        print ("User already has an image, no need to download from Facebook")
                                        
                                        self.uiimvProfilePic.image = UIImage(data:data!)?.circleMasked
                                        
                                        
                                        
                                        
                                        
                                        
                                    }
                                    
                                    // Data for "images/island.jpg" is returned
                                    // ... let islandImage: UIImage! = UIImage(data: data!)
                                    
                                    
                                    
                                    if (email != nil){
                                        
                                        
                                        email = user.email
                                        
                                        
                                        
                                        
                                    }
                                        
                                        
                                        
                                    else{
                                        
                                        let UserEmail = FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"email"]).start { (connection, result, error) -> Void in
                                            
                                            
                                            let strEmail: String = ((result as AnyObject).object(forKey: "email") as? String)!
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            //  print (strEmail)
                                            
                                            //print ((FIRAuth.auth()?.currentUser?.photoURL?.absoluteString) as String!)
                                            
                                            let values = ["name": FIRAuth.auth()?.currentUser?.displayName as String!, "email": strEmail, "profileImageUrl":(FIRAuth.auth()?.currentUser?.photoURL?.absoluteString) as String! , "pushID": PushingID]
                                            
                                            
                                            
                                            
                                            self.registerUserIntoDatabaseWithUID(FIRAuth.auth()?.currentUser?.uid as String!, values: values as [String : AnyObject])
                                            
                                            
                                            
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    
                                }
                            }
                            
                            
                            if(self.uiimvProfilePic.image == nil) {
                                
                                
                                
                                let profilePic = FBSDKGraphRequest(graphPath: "me/picture", parameters: ["height":300, "width":300,"redirect":false], httpMethod: "GET")
                                profilePic?.start(completionHandler: {(connection, result, error) -> Void in
                                    // Handle the result
                                    
                                    
                                    if (error == nil){
                                        
                                        let dictionary = result as? NSDictionary
                                        
                                        let data = dictionary?.object(forKey: "data")
                                        
                                        let urlPic = ((data as AnyObject).object(forKey: "url"))! as! String
                                        
                                        if let imagedata = try? Data(contentsOf: URL(string: urlPic)!){
                                            
                                            
                                            
                                            
                                            
                                            let uploadTask = profilePicRef.put(imagedata, metadata:nil){
                                                
                                                
                                                metadata,error in
                                                
                                                if (error == nil){
                                                    
                                                    let downloadUrl = metadata!.downloadURL
                                                    
                                                }
                                                    
                                                else{
                                                    
                                                    
                                                    print("ERROR IN DOWNLOAIND IMAGE")
                                                    
                                                }
                                            }
                                            
                                            self.uiimvProfilePic.image = UIImage(data:imagedata)?.circleMasked
                                            
                                            
                                            
                                            
                                            
                                        }
                                        
                                    }
                                })
                                
                                
                            } //end if
                            
                            
                        } else {
                            // No user is signed in.
                        }
                        
                        
                        
                        /* let UserEmail = FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"email"]).startWithCompletionHandler { (connection, result, error) -> Void in
                         
                         
                         let strEmail: String = (result.objectForKey("email") as? String)!
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         //  print (strEmail)
                         
                         //print ((FIRAuth.auth()?.currentUser?.photoURL?.absoluteString) as String!)
                         
                         let values = ["name": FIRAuth.auth()?.currentUser?.displayName as String!, "email": strEmail, "profileImageUrl":(FIRAuth.auth()?.currentUser?.photoURL?.absoluteString) as String! ]
                         
                         
                         
                         
                         self.registerUserIntoDatabaseWithUID(FIRAuth.auth()?.currentUser?.uid as String!, values: values)
                         
                         
                         
                         }*/
                        
                        
                        let values = ["name": FIRAuth.auth()?.currentUser?.displayName as String!, "email": FIRAuth.auth()?.currentUser?.email as String!, "profileImageUrl":(FIRAuth.auth()?.currentUser?.photoURL?.absoluteString) as String!] //"pushID": self.userPushID ]
                        
                        
                        
                        
                        self.registerUserIntoDatabaseWithUID(FIRAuth.auth()?.currentUser?.uid as String!, values: values as [String : AnyObject])
                        
                        
                        
                        
                    default:
                        print("user is signed in with \(userInfo.providerID)")
                        
                        print("this is empty?", FIRAuth.auth()?.currentUser?.photoURL)
                        
                        let userIdForPic = FIRAuth.auth()?.currentUser?.uid as String!
                        
                        let picRef = FIRDatabase.database().reference().child("users").child(userIdForPic!).child("profileImageUrl")
                        
                        picRef.observe(.value, with: { (snapshot) in
                            
                            // print("This is it!",snapshot.value as! String!)
                            
                            
                            self.usersPhotoLink = snapshot.value as! String!
                            
                            
                            
                            let imageCache = NSCache<AnyObject, AnyObject>()
                            
                            let url = URL(string: self.usersPhotoLink as String! )
                            
                            
                            print("THIS IS THE URL", url)
                            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                                
                                //download hit an error so lets return out
                                if error != nil {
                                    print("THIS IS THE ERROR",error)
                                    return
                                }
                                
                                DispatchQueue.main.async(execute: {
                                    
                                    if let downloadedImage = UIImage(data: data!) {
                                        imageCache.setObject(downloadedImage, forKey: self.usersPhotoLink as String! as AnyObject)
                                        
                                        print("THIS WORKS?", self.usersPhotoLink as String!)
                                        
                                        self.uiimvProfilePic.image = downloadedImage.circleMasked
                                        
                                        
                                        
                                        
                                    }
                                })
                                
                            }).resume()
                            
                            
                            // self.usersPhotoLink.append(FIRDataSnapshot)
                            
                            
                            
                            
                        }, withCancel: nil)
                        
                        
                        
                        
                        
                        let userNameRef = FIRDatabase.database().reference().child("users").child(userIdForPic!).child("name")
                        
                        userNameRef.observeSingleEvent(of: .value, with: { (snapshot) in
                            
                            self.uilName.text = snapshot.value as! String!
                            self.uilName.isHidden = false
                            
                            
                        }, withCancel: nil)
                        
                        
                    }
                }
                
            }
            
            
            
            
            
        
            
            
            
            
       

        
    }
    
    
  /*  override var shouldAutorotate : Bool {
        return false
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    } */
    
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        let ref = FIRDatabase.database().reference()
        let usersReference = ref.child("users").child(uid)
        
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if err != nil {
                print(err)
                return
            }
            
          
        })
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


extension UIImage {
    var isPortrait:  Bool    { return size.height > size.width }
    var isLandscape: Bool    { return size.width > size.height }
    var breadth:     CGFloat { return min(size.width, size.height) }
    var breadthSize: CGSize  { return CGSize(width: breadth, height: breadth) }
    var breadthRect: CGRect  { return CGRect(origin: .zero, size: breadthSize) }
    var circleMasked: UIImage? {
        UIGraphicsBeginImageContextWithOptions(breadthSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let cgImage = cgImage?.cropping(to: CGRect(origin: CGPoint(x: isLandscape ? floor((size.width - size.height) / 2) : 0, y: isPortrait  ? floor((size.height - size.width) / 2) : 0), size: breadthSize)) else { return nil }
        UIBezierPath(ovalIn: breadthRect).addClip()
        UIImage(cgImage: cgImage).draw(in: breadthRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
