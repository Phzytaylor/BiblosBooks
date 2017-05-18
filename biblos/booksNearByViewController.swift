//
//  booksNearByViewController.swift
//  biblos
//
//  Created by Taylor FIckle Simpson on 2/10/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase


class booksNearByViewController: UIViewController, UINavigationControllerDelegate, UINavigationBarDelegate, CLLocationManagerDelegate, GADBannerViewDelegate {
    
  
 //  var modelName = UIDevice.current.modelName
   
    let manager = CLLocationManager()
    
 //SEGUE STUFF MAN!
    
    var bookAuthor = String()
    var bookGenre = String()
    var Comment = String()
    var bookUser = String()
    var bookPhoto = String()
   var userID = String()
    var userPhoto = String()
    var userLocation = String()
    var bookRating = String()
   var bookPushingID = String()
    var bookTitle = String()
    
/////////
    
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
            
            myBanner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:270).isActive = true
            myBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            myBanner.widthAnchor.constraint(equalToConstant: 320).isActive = true
            
            myBanner.heightAnchor.constraint(equalToConstant: 100).isActive = true }
        
        
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2 || modelName == Devices.Other{
        
            myBanner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:400).isActive = true
            myBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            myBanner.widthAnchor.constraint(equalToConstant: 728).isActive = true
            
            myBanner.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        
        
        }
        
        
        if modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhoneSE{
            
            myBanner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:185).isActive = true
            myBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            myBanner.widthAnchor.constraint(equalToConstant: 320).isActive = true
            
            myBanner.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            
        }
        
        if modelName == Devices.IPhone6{
        
            myBanner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:232).isActive = true
            myBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            myBanner.widthAnchor.constraint(equalToConstant: 320).isActive = true
            
            myBanner.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        }
        
        
        if modelName == Devices.IPhone6S || modelName == Devices.IPhone7{
        
            myBanner.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:235).isActive = true
            myBanner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            myBanner.widthAnchor.constraint(equalToConstant: 320).isActive = true
            
            myBanner.heightAnchor.constraint(equalToConstant: 100).isActive = true
            

        
        
        }
        
        
    }
    
    
    func showChatControllerForUser(_ user: User) {
        let chatLogController = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
        chatLogController.user = user
        chatLogController.pushToUser = bookPushingID
        
        print("TRY THIS", bookPushingID)
        //navigationController?.pushViewController(chatLogController, animated: true)
        
        navigationController?.show(chatLogController, sender: view)
    }

    
   // var bookResultArray: [FIRDataSnapshot]! = []
   var bookLatArray = [String]()
   var bookLngArray = [String]()
    
    var bookNodes = [String]()
    
    var booksArray = [[String]]()
    
    var bookTitlesArray = [String]()
    
    var commentsArry = [String]()
    
    var bookLatArrayDouble = [Double]()
    var bookLngArrayDouble = [Double]()
    
    var bookCordArray = [[Double]]()
    
    
    var bookLocation: [CLLocationCoordinate2D] = []
    
    var bookAnts: [BookAnnotation] = []
    
    
    
    let bookTitleArray = [String]()
    
    var AuthorArray = [String]()
    var CommentArray = [String]()
    var GenreArray = [String]()
    var UserArray = [String]()
    var bookPhotoArray = [String]()
   var userIDArray = [String]()
   var userLocationArray = [String]()
   var bookRateArray = [String]()
    var  userToBePushedArray = [String]()
    
    var userPhotoArray = [String]()
    
    
    @IBOutlet var Map: MKMapView!
   

    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tabBarController?.navigationItem.titleView = nil
        self.tabBarController?.navigationItem.title = "Book Map"
        self.navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        self.navigationController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(mapRefresh))
        
        tabBarController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.white

        
       
        
        
    }
    
    
    
    func mapRefresh(){
    
    
        let allAnnotations = self.Map.annotations
        self.Map.removeAnnotations(allAnnotations)
        
        
        self.bookLatArrayDouble.removeAll()
        
        self.bookLngArrayDouble.removeAll()
        
        self.bookTitlesArray.removeAll()
        
        self.commentsArry.removeAll()
        
        self.AuthorArray.removeAll()
        
        self.CommentArray.removeAll()
        
        self.GenreArray.removeAll()
        
        self.UserArray.removeAll()
        
        self.bookPhotoArray.removeAll()
        
        self.userIDArray.removeAll()
        
        self.userLocationArray.removeAll()
        
        self.bookRateArray.removeAll()
        
        self.userToBePushedArray.removeAll()
        
        self.userPhotoArray.removeAll()

        
        
        
        
        
        
        
        postBooks()
        
        print("Refreshed")
    
    }
    
    
      let dataBase = FIRDatabase.database()
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        Map.setRegion(region, animated: true)
        
        self.Map.showsUserLocation = true
        
        manager.stopUpdatingLocation()
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        manager.requestWhenInUseAuthorization()
        
        manager.startUpdatingLocation()
        
        
        Map.delegate = self
        
         UIApplication.shared.statusBarStyle = .lightContent
        
       
         tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(mapRefresh))
       tabBarController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        
        postBooks()
        
        
        view.addSubview(myBanner)
        
        setupMyGoogleAd()
        
       // MoreInfoView.isHidden = true
        
               
        
    }
    
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: { _ in
            view.isHidden = hidden
        }, completion: nil)
    }
    
    
    
 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        
        
        if (segue.identifier == "moreInfo") {
            
     
            //let navVC = segue.destinationViewController as! UINavigationController
            
            let viewController = segue.destination as! MoreInfoViewController
            
            
            
            
            let moreInfoSnaphot:  FIRDataSnapshot! = self.SecondResultArray[indexPath.row]
            
            let moreInfoCells = moreInfoSnaphot.value as! Dictionary<String, String>
            
            let AuthorInfo = moreInfoCells["Author"] as String!
            let CommentInfo = moreInfoCells["Comment"] as String!
            let GenreInfo = moreInfoCells["Genre"] as String!
            let UserInfo = moreInfoCells["User"] as String!
            let titleInfo = moreInfoCells["title"] as String!
            let bookPhotoInfo = moreInfoCells["bookPhoto"] as String!
            let userIDInfo = moreInfoCells["userID"] as String!
            let userPIC = moreInfoCells["userPhoto"] as String!
            let userLocation = moreInfoCells["userLocation"] as String!
            let userToBePushed = moreInfoCells["pushingID"] as String!
            
            print(userToBePushed)
            
            
            userPictureURL = userPIC
            
            
            
            
            // This posts the comment about the book in the info view
            
            bookInfoSender = CommentInfo
            
            //These two vars are to handel messageing and can be referenced later
            userTobeMessaged = UserInfo
            
            userToBeMessagedId = userIDInfo
            
            ////////////////////////////////////////
            
            // initialize new view controller and cast it as your view controller
            
            // your new view controller should have property that will store passed value
            viewController.bookComment = bookInfoSender
            viewController.UserToBeContacted = UserInfo
            viewController.UserContactedID = userToBeMessagedId
            viewController.userPictureurl = userPictureURL
            viewController.userLocate = userLocation
            viewController.bookPictureLink = bookPhotoInfo
            viewController.genreOfBook = GenreInfo
            viewController.titleOfBook = titleInfo
            viewController.userBeingPushedMSG = userToBePushed
            
            print("THIS IS THE USER TO BE PUSHED \(userToBePushed)")
        }
        
        
        
        
        
      
        
        
    }
     */
    

    
    override func viewDidDisappear(_ animated: Bool) {
        manager.stopUpdatingLocation()
        
        self.tabBarController?.navigationItem.leftBarButtonItem = nil
        self.tabBarController?.navigationItem.hidesBackButton = false
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

   
}
