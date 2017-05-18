//
//  MyBooksTableViewController.swift
//  biblos
//
//  Created by Taylor FIckle Simpson on 7/26/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import DZNEmptyDataSet

import Kingfisher



let dataBase = FIRDatabase.database()

 var refreshControl: UIRefreshControl = UIRefreshControl()


class MyBooksTableViewController: UITableViewController, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "You Haven't Uploaded A Book Yet!"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Tap The Upload Tab To Add A Book!"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "UpLoadBook.png")
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor {
        return UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
    }
    
    
   /* func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControlState) -> NSAttributedString? {
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
*/
    
    
    
    @IBOutlet weak var myBanner: GADBannerView!
    
    var bookKey: String!
    
    
   
    

    override func viewDidLoad() {
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
        
        tableView.backgroundView = UIImageView( image: UIImage(named: "booksCoffee.jpg"))
        
        
       navigationController!.navigationBar.barTintColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        
        refreshControl?.addTarget(self, action: #selector(MyBooksTableViewController.refreshData), for: UIControlEvents.valueChanged)
        
        refreshControl?.tintColor = UIColor.white
        refreshControl?.backgroundColor = UIColor.blue
        
        refreshControl?.attributedTitle = NSAttributedString(string:"Fetching Your Books", attributes: [NSForegroundColorAttributeName : refreshControl?.tintColor])
        
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true
       
        if #available(iOS 10.0, *){
        
            tableView.refreshControl = refreshControl
        
        }else{
            
            tableView.addSubview(refreshControl!)}
        
        
        
      observeUserBooks()
        
        
        
       
        
        tabBarController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.tabBarController?.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        
       
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
         UIApplication.shared.statusBarStyle = .lightContent

       
    }
    
    
    func refreshData(){
    
        
        BookArray.removeAll()
        
        books.removeAll()
        
        observeUserBooks()
        
        tableView.reloadData()
        
        refreshControl?.endRefreshing()
        
        

    
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        
         self.tabBarController?.navigationItem.titleView = nil
        self.tabBarController?.navigationItem.title = "My Books"
        
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true
        
       self.tabBarController?.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]        
        
        
    
        
    }
    
   
    
    var books = [Book]()
    
    
    
   var bookDictionary = [String: Book]()
    
    var BookArray: [FIRDataSnapshot]! = []
    
    
    
    func observeUserBooks() {
    
        
     
        guard let uid = FIRAuth.auth()?.currentUser?.uid as String! else{
        
        
            return
        
        
        }
        
        
     
        
       let ref = FIRDatabase.database().reference().child("user-books")
        
       
        ref.observe(.childAdded, with: { (snapshot) in
            
            
           
            
            
            let userId = snapshot.key
            print(snapshot.childrenCount)
            
            //print("This is interesting...", snapshot.value)
         
            print(userId)
            
            if userId == uid {
          
            
                
            let bookRef = FIRDatabase.database().reference().child("user-books").child(userId)
                
             
            
            bookRef.observe(.childAdded, with: { (snapshot) in
                
                let bookID = snapshot.key
                
                print("This is new",snapshot.children)
                
                
                print(bookID,"sigh..")
                
                self.bookKey = snapshot.key
                
               
                
                let booksIDref = FIRDatabase.database().reference().child("books").child(bookID)
              
                
                
                booksIDref.observe(.value, with: { (snapshot) in
                    
                    
                    if let dictionary = snapshot.value as? [String: AnyObject]{
                    
                    
                        let book = Book()
                        
                        book.setValuesForKeys(dictionary)
                        
                        
                        self.books.append(book)
                        
                        print(book.Author)
                        
                        DispatchQueue.main.async(execute: {
                            self.tableView.reloadData()
                        })
                    
                   
                    
                    
                    }
                    
                   
                    
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                 
                    }, withCancel: nil)
                
                if snapshot.exists(){
                    
                    
                    
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                    
                }

                }, withCancel: nil) }
        
          
           
        
        }, withCancel: nil)
        
        
       
       
       
    
    
    }
    
    
    
  
    fileprivate func attemptBookReloadOfTable() {
        self.timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.handleBookReloadTable), userInfo: nil, repeats: false)
    }

    
    func handleBookReloadTable() {
        
        
        //this will crash because of background thread, so lets call this on dispatch_async main thread
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            
            
        })
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
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myBookCell", for: indexPath) as! MyBooksTableViewCell

       
        
        // Configure the cell...
        
        
        let book = books[indexPath.row]
        
        
       
        
       
        
        
        let Author = book.Author as String!
        let Comment = book.Comment as String!
        let Genre = book.Genre as String!
        let User = book.User as String!
        let title = book.title as String!
        let bookPhoto = book.bookPhoto as String!
        let userID = book.userID as String!
        let userLocation = book.userLocation as String!
        
        
        
        let processor = RoundCornerImageProcessor(cornerRadius: 7000)
        
        
        
        
        let url = URL(string: bookPhoto!)!
        //imageView.kf.setImage(with: url)
        
        
      
                 //let url = URL(string: bookPhoto!)
        
          // let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check
           
        let p = Bundle.main.path(forResource: "book009", ofType: "gif")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: p))
     
        cell.myBookImageView.kf.indicatorType = .image(imageData: data)

        cell.myBookImageView.setRounded()
        
       
        
        cell.myBookImageView.kf.setImage(with: url, placeholder: UIImage(named:"old-books-436498_640.jpg"), options: [.transition(.fade(0.2))])
        
        cell.myBookImageView.backgroundColor = .clear
                
                
                //cell.myBookImageView?.image = image?.circleMask
        
        
        
        //cell.myBookLabel?.numberOfLines = 0
        cell.myBookLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        
        
        
        
        
        
        
        cell.myBookLabel?.text = "Title: " + "\n" + title! as String + "\n" + "Author: " + Author! as String + "\n"  + "Genre: " + Genre! as String
        
        cell.myBookLabel?.textColor = .white
        
        cell.backgroundColor = UIColor.clear
        
        
        cell.myBookLabel?.textColor = UIColor.white
        
        cell.myBookLabel?.font = UIFont(name: "Chalkduster", size: 20)
        

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            
            
            guard let uid = FIRAuth.auth()?.currentUser?.uid as String! else{
                
                
                return
                
                
            }
            
            
            let book = books[indexPath.row]
            
            
            
            
            
            
            
            let Author = book.Author as String!
            let Comment = book.Comment as String!
            let Genre = book.Genre as String!
            let User = book.User as String!
            let title = book.title as String!
            let bookPhoto = book.bookPhoto as String!
            let userID = book.userID as String!
            let userLocation = book.userLocation as String!
            
        
           let bookRef = dataBase.reference().child("books").child(self.bookKey)
            
            let userBookRef = dataBase.reference().child("user-books").child(uid).child(self.bookKey)
           
            let storage = FIRStorage.storage()
            
             let storageRef = storage.reference(forURL: "gs://biblos-1.appspot.com")
            
             let filePath =  ("/biblos-1.appspot.com/bookPhoto"+book.title!+(FIRAuth.auth()?.currentUser?.uid as String!))
            
            bookRef.removeValue()
            
            userBookRef.removeValue()
            
                // Delete the file
            storageRef.child(filePath).delete { error in
                if let error = error {
                    // Uh-oh, an error occurred!
                    
                    print("Uh-oh, an error occurred!")
                    
                } else {
                    // File deleted successfully
                    
                    print("File deleted successfully")
                }
            }
            
            
            // Delete the row from the data source
            
            books.remove(at: indexPath.row)
            
        
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
           BookArray.removeAll()
            
            books.removeAll()
            
            observeUserBooks()
            
            self.tableView.reloadData()
            
            
 
           
            
           
            

        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    fileprivate func attemptReloadOfTable() {
        self.timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.handleReloadTable), userInfo: nil, repeats: false)
    }

 var timer: Timer?
    
    
    func handleReloadTable() {
       
        
        //this will crash because of background thread, so lets call this on dispatch_async main thread
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }

    
}



extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
