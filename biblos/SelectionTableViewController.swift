//
//  SelectionTableViewController.swift
//  
//
//  Created by Taylor FIckle Simpson on 7/10/16.
//
//

import UIKit
import Firebase
import FBSDKCoreKit

class SelectionTableViewController: UITableViewController {


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("Group Conversation")
            
        case 1:
            print("Regular Conversation")
       
        default:
            assertionFailure("Option not found")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handelLogout))
        
        
        
        
        
        
    }
    
    
    
    func handelLogout() {
        
        
        //signs user out of firebase app
        
        try! FIRAuth.auth()!.signOut()
        
        //sign user out of facebook app
        
        FBSDKAccessToken.setCurrent(nil)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        
        let viewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginView")
        
        self.present(viewController, animated: true, completion: nil)
        

        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }




}
