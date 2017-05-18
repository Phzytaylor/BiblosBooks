//
//  MoreInfoViewController.swift
//  biblos
//
//  Created by Taylor FIckle Simpson on 7/8/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit
import Firebase
import MessageUI

class MoreInfoViewController: UITableViewController,MFMailComposeViewControllerDelegate {

    var user:User?
    
    var bookComment: String!
    var UserToBeContacted: String!
    var UserContactedID: String!
    var userPictureurl: String!
    var userLocate: String!
    var titleOfBook: String!
    var genreOfBook: String!
    var bookPictureLink: String!
    var userBeingPushedMSG: String!
    
    
    
    
    
 
    @IBOutlet weak var imageView: UIImageView!
    
    
   @IBOutlet weak var messageButton: UIButton!
    
    @IBAction func messageButton(_ sender: AnyObject) {
        
        
        // var user = User()
        
        
        
        let user = User()
        
        user.id = UserContactedID
        
        user.name = UserToBeContacted
        
        
        
        
        self.showChatControllerForUser(user)
        
        
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
       
        navigationController!.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Report", style: .plain, target: self, action: #selector(reportUser))
        
        self.navigationController!.navigationItem.rightBarButtonItem?.tintColor = .white
        
        self.navigationController!.navigationItem.leftBarButtonItem?.tintColor = .white
        
        self.navigationController!.navigationItem.backBarButtonItem?.tintColor = .white
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        

    }
    
    
    
    
    func reportUser() {
    
        
        
        //this function reports the user
        
       
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["biblosbooksapp@gmail.com"])
            mail.setMessageBody("<p>User \(UserToBeContacted) with id \(UserContactedID) with book title \(titleOfBook) image url: \(bookPictureLink) genre \(genreOfBook) and user photo url of \(userPictureurl)</p>", isHTML: true)
            
            present(mail, animated: true, completion: nil)
        } else {
            // show failure alert
        }
        
    
    
    
    
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    //
    
    override func viewDidLoad() {
       messageButton.setTitle("Contact \(UserToBeContacted!)", for: UIControlState())
        
        navigationItem.title = "More Info"
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "old-books-436498_640.jpg"))
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        navigationController!.navigationBar.barTintColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        self.tabBarController?.navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Report", style: .plain, target: self, action: #selector(reportUser))

        self.tabBarController?.navigationController!.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 122.0
        
        
        let p = Bundle.main.path(forResource: "book009", ofType: "gif")!
        let datas = try! Data(contentsOf: URL(fileURLWithPath: p))

        
        if let checkedUrl = URL(string: bookPictureLink) {
            
            
            imageView.contentMode = .scaleToFill
            
            
            downloadImage(url: checkedUrl)
        }
    
        
        super.viewDidLoad()
        
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
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! MoreInfoTableViewCell

        // Configure the cell...
        
        
        cell.bookInfoLabel?.text = bookComment + "\n" + "Located in :" + "\n" + userLocate
        //cell.textLabel?.numberOfLines = 0
        
        
        cell.bookInfoLabel?.textColor = .white
        
        
        cell.backgroundColor = .clear
        
        
        cell.bookInfoLabel?.font = UIFont(name: "Chalkduster", size: 30)
        

        return cell
    }
    
    
    
    
    
    
    
    func showChatControllerForUser(_ user: User) {
        let chatLogController = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
        chatLogController.user = user
        chatLogController.pushToUser = userBeingPushedMSG
        
        
        print("TRY THIS", userBeingPushedMSG)
        navigationController?.pushViewController(chatLogController, animated: true)
    }
    
    
 

  /*  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "messager" {
        
       //let navVc = segue.destinationViewController as! UINavigationController // 1
        //let chatVc = navVc.viewControllers.first as! ChatViewController // 2
            let chatVc = segue.destinationViewController as! ChatViewController
          
            
        chatVc.senderId = FIRAuth.auth()?.currentUser?.uid // 3
        chatVc.senderDisplayName = FIRAuth.auth()?.currentUser?.displayName // 4
        
            chatVc.userToBeChatted = UserToBeContacted
            chatVc.userContacedID = UserContactedID
            
            chatVc.userImageString = userPictureurl
        
        }
    } */

}
