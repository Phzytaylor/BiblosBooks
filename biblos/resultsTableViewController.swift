//
//  resultsTableViewController.swift
//  biblos
//
//  Created by Taylor FIckle Simpson on 9/14/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit
import Firebase

class resultsTableViewController: UITableViewController {
    
    @IBOutlet weak var photoButton: UIButton!
   
    var usersPhotoLink: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        photoButton.layer.cornerRadius = 5

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

  /*  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    } */

  /*  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
*/
    
   /* override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("settingsCell")
        
        
        let userIdForPic = FIRAuth.auth()?.currentUser?.uid as String!
        
        let picRef = FIRDatabase.database().reference().child("users").child(userIdForPic).child("profileImageUrl")
        
        picRef.observeEventType(.Value, withBlock: { (snapshot) in
            
            // print("This is it!",snapshot.value as! String!)
            
            
            self.usersPhotoLink = snapshot.value as! String!
            
            
            
            let imageCache = NSCache()
            
            let url = NSURL(string: self.usersPhotoLink as String! )
            
            
            print("THIS IS THE URL", url)
            NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) in
                
                //download hit an error so lets return out
                if error != nil {
                    print("THIS IS THE ERROR",error)
                    return
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    if let downloadedImage = UIImage(data: data!) {
                        imageCache.setObject(downloadedImage, forKey: self.usersPhotoLink as String!)
                        
                        print("THIS WORKS?", self.usersPhotoLink as String!)
                        
                        cell?.imageView?.image = downloadedImage.circleMask
                        
                        
                        cell!.textLabel?.numberOfLines = 0
                        cell!.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
                        
                    }
                })
                
            }).resume()
            
            
            // self.usersPhotoLink.append(FIRDataSnapshot)
            
            
            
            
            }, withCancelBlock: nil)
        
        
        
        return cell!
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
