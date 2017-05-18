//
//  NewMoreInformationViewController.swift
//  biblos
//
//  Created by Taylor Simpson on 5/14/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import UIKit
import Firebase
import MessageUI

class NewMoreInformationViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var summaryView: UIView!
    @IBOutlet weak var summaryViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageUserButton: UIButton!
    
    
    @IBAction func messageUserButton(_ sender: AnyObject) {
        
        
        
        let user = User()
        
        user.id = UserContactedID
        
        user.name = UserToBeContacted
        
        
        
        
        self.showChatControllerForUser(user)

        
    }
    
    
    
    var summaryViewHeight: CGFloat! {
        /*
         Here we're using a property observer to execute code whenever
         this value is updated
         */
        
        didSet {
            print("stackViewHeight updated to \(summaryViewHeight)")
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseIn], animations: {
                self.summaryViewHeightConstraint.constant = self.summaryViewHeight
                self.view.layoutIfNeeded()
            }) { _ in
                self.summaryTextView.scrollRangeToVisible(NSRange(location: 0, length: 0))
                print("animation complete")
            }
        }
    }
    
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
         UIApplication.shared.statusBarStyle = .lightContent
        
        configureTapGesture()
        
        messageUserButton.setTitle("Contact \(UserToBeContacted!)", for: UIControlState())
        
        navigationItem.title = titleOfBook
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        navigationController!.navigationBar.barTintColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        self.tabBarController?.navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Report", style: .plain, target: self, action: #selector(reportUser))
        
        self.tabBarController?.navigationController!.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        self.summaryTextView.text = bookComment
        
        
        let p = Bundle.main.path(forResource: "book009", ofType: "gif")!
        let datas = try! Data(contentsOf: URL(fileURLWithPath: p))
        
        
        if let checkedUrl = URL(string: bookPictureLink) {
            
            var placeHolderImage = UIImage(named: "largelib.jpeg")
            
            imageView.contentMode = .scaleToFill
            
            imageView.kf.indicatorType = .activity
            
            imageView.kf.setImage(with: checkedUrl, placeholder: placeHolderImage)
            
            
           // downloadImage(url: checkedUrl)
        }
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showChatControllerForUser(_ user: User) {
        let chatLogController = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
        chatLogController.user = user
        chatLogController.pushToUser = userBeingPushedMSG
        
        
        print("TRY THIS", userBeingPushedMSG)
        navigationController?.pushViewController(chatLogController, animated: true)
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(false)
        navigationController!.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Report", style: .plain, target: self, action: #selector(reportUser))
        
        self.navigationController!.navigationItem.rightBarButtonItem?.tintColor = .white
        
        self.navigationController!.navigationItem.leftBarButtonItem?.tintColor = .white
        
        self.navigationController!.navigationItem.backBarButtonItem?.tintColor = .white
        
        summaryViewHeight = summaryViewHeightConstraint.constant
        summaryViewHeight = UIScreen.main.bounds.height/2
        
        
        
        
    }
    
    func configureTapGesture() {
    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleHeight(sender:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        summaryView.addGestureRecognizer(tapGestureRecognizer)
    
    
    }
    
    
    func toggleHeight(sender: UITapGestureRecognizer) {
        if summaryViewHeightConstraint.constant == UIScreen.main.bounds.height / 2 {
            // true
            summaryViewHeight = UIScreen.main.bounds.height - 80 // gives space for status bar and navigation bar
        } else {
            // false
            summaryViewHeight = UIScreen.main.bounds.height / 2
        }
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
    
    
  /*  func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.imageView.image = UIImage(data: data)
            }
        }
    } */
    
    
}
