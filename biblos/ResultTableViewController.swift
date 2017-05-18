//
//  ResultTableViewController.swift
//  biblos
//
//  Created by Taylor Simpson on 6/15/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit
import Firebase
import DZNEmptyDataSet
import Kingfisher






extension UIImage {
    public func imageRotatedByDegrees(_ degrees: CGFloat, flip: Bool) -> UIImage {
        let radiansToDegrees: (CGFloat) -> CGFloat = {
            return $0 * (180.0 / CGFloat(M_PI))
        }
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
        let t = CGAffineTransform(rotationAngle: degreesToRadians(degrees));
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap!.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0);
        
        //   // Rotate the image context
        bitmap!.rotate(by: degreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        var yFlip: CGFloat
        
        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }
        
        bitmap!.scaleBy(x: yFlip, y: -1.0)
        bitmap!.draw(cgImage!, in: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}


class ResultTableViewController: UITableViewController, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    var userTobeMessaged: String!
    
    var userToBeMessagedId: String!
    
    var toBeUserId: String!
       
    var bookInfoSender: String!
    
    
     var userPictureURL : String!
    
    var postID: String!
    
 
    
    
    
    
    let dataBase = FIRDatabase.database()
    
    var SecondResultArray: [FIRDataSnapshot]! = []
    
    var someString: String?{
    
        didSet{
        
        
        print("I AM A LARGE TEXT")
            
            
            print(someString)
            
            
        
        
        }
    
    
        
    
    
    
    }
    
    
    
    
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "There are no books here yet, but users like you can change that!"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
   func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Tap Below To Add A Book"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "OpenBook.png")
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor {
        return UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)

    }
    
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControlState) -> NSAttributedString? {
        let str = "Tap Me To Upload Your Book"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.callout), NSForegroundColorAttributeName: UIColor.white]
    
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTap button: UIButton) {
        /*let ac = UIAlertController(title: "Button tapped!", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Hurray", style: .default))
        present(ac, animated: true)
        */
        
        performSegue(withIdentifier: "upLoadThings", sender: AnyObject.self)
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 200
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
    }
    
    override func viewDidLoad() {
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "ResultBooks.jpeg"))
        
        navigationController!.navigationBar.barTintColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
       self.navigationController!.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        
        
        let bookRef = dataBase.reference().child("books")
        
        bookRef.queryOrdered(byChild: "Genre")
            .queryEqual(toValue: someString)
            .observeSingleEvent(of: .value, with:{ snapshot in
                
                if snapshot.exists(){
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                
                }
                
                for child in snapshot.children {
                    
                    
                    self.SecondResultArray.append(child as! FIRDataSnapshot)
                    //print(self.ResultArray)
                    
                    
                    
                    
                }
                
                
                
                DispatchQueue.main.async {
                    
                    
                    
                

                    
                    self.tableView.reloadData()
                }
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
            })
       
        
        super.viewDidLoad()

      UIApplication.shared.statusBarStyle = .lightContent
        tableView.estimatedRowHeight = 700
        
        tableView.rowHeight = UITableViewAutomaticDimension
     
    }
    
    
    func handelInbox(){
        let newMessageController = MessagesController()
       
        present(newMessageController, animated: true, completion: nil)
    }
   
    func back(){
    
    
    
    
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SecondResultArray.count
    }
    
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! BooksTableViewCell

        // Configure the cell...
        
        let bookSnapShot: FIRDataSnapshot! = self.SecondResultArray[indexPath.row]
        
        let book = bookSnapShot.value as! Dictionary<String, String>
        
        let Author = book["Author"] as String!
        let Comment = book["Comment"] as String!
        let Genre = book["Genre"] as String!
        let User = book["User"] as String!
        let title = book["title"] as String!
        let bookPhoto = book["bookPhoto"] as String!
        let userID = book["userID"] as String!
        let userLocation = book["userLocation"] as String!
        let bookRate = book["bookRating"] as String!
        let userToBePushed = book["pushingID"] as String!
        let bookLat = book["bookLat"] as String!
        let bookLng = book["bookLng"] as String!
        
      
        
       /* let url = NSURL(string: bookPhoto)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        
        
        
        cell.imageView!.image = UIImage(data: data!)
 */
       
        if bookRate == "Age Restricted"{
        
            
            //cell.bookLabel?.numberOfLines = 0
            cell.bookLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            
            
            
            cell.bookLabel?.text = "This book is age restricted that is why you are seeing a default image"
+ "\n" + "Title: " + title! as String + "\n" + "Author: " + Author! as String + "\n" + "Comment: " + Comment! as String + "\n" + "Genre: " + Genre! as String + "\n" + "User: " + User! as String + "\n" + "Location: " + userLocation! as String
           
            

        cell.bookImageView?.image = UIImage(named: "old-books-436498_640.jpg")?.circleMask
        
        
        }
        else {
        
        let url = URL(string: bookPhoto!)
            
            
            let p = Bundle.main.path(forResource: "book009", ofType: "gif")!
            let datas = try! Data(contentsOf: URL(fileURLWithPath: p))
            
            cell.bookImageView.kf.indicatorType = .image(imageData: datas)
            
            cell.bookImageView.setRounded()
            
            
            let processor = RoundCornerImageProcessor(cornerRadius: 100)

            
            cell.bookImageView.kf.setImage(with: url, placeholder: UIImage(named:"old-books-436498_640.jpg"), options: [.transition(.fade(0.2))])

        
        
        
     /*   DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async {
            
            

            
           // let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            DispatchQueue.main.async(execute: {
                
                
                
                
              //  let images = UIImage(data: data!)
                
                
                //cell.bookImageView!.image = UIImage(data: data!)?.circleMask
                
                
                self.tableView.reloadData()
            });
        } */
        
        
        
      // cell.bookLabel?.numberOfLines = 0
        cell.bookLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        cell.bookLabel?.text = "Title: " + title! as String + "\n" + "Author: " + Author! as String + "\n" + "Tap for more info!"
            

            
            
     
        }
        
        cell.backgroundColor = .clear
        
       cell.bookLabel?.textColor = UIColor.white
        
        cell.bookLabel?.font = UIFont(name: "Chalkduster", size: 20)
        
        return cell
    }
    
    
   
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
       
        
        if (segue.identifier == "upLoadThings"){
        
        let viewController = segue.destination as! UploadViewController
        
        
        }
        
        
        
        if (segue.identifier == "moreInfo") {
            
           
          //let navVC = segue.destinationViewController as! UINavigationController
            
            //This was before the major UI Update ---------
            
            //let viewController = segue.destination as! MoreInfoViewController
            
            
            //-------------------------------------
            
            let viewController = segue.destination as! NewMoreInformationViewController
            
            let indexPath : IndexPath = self.tableView.indexPathForSelectedRow!
            
            
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
        
        
        
      
        
        /* let navVc = segue.destinationViewController as! UINavigationController // 1
        let chatVc = navVc.viewControllers.first as! ChatViewController // 2
        chatVc.senderId = FIRAuth.auth()?.currentUser?.uid // 3
        chatVc.senderDisplayName = FIRAuth.auth()?.currentUser?.displayName // 4
        
      
        let userPingged = pinggedUser
        
        let userTochatWith = toBeUserId
        
        
        chatVc.userPingged = userPingged
        
        chatVc.userToBeChatted = userTochatWith

        */
        

    }
    
    
    
   

}
