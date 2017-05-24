//
//  ViewController.swift
//  biblos
//
//  Created by Taylor Simpson on 6/8/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController,FBSDKLoginButtonDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
   
    
    
    
    

    
//var modelName = Devices.IPhone5
var modelName = UIDevice.current.modelName
    
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        print ("user logged in")
        
        self.loginButton.isHidden = true
        
        aivLoadingSpinner.startAnimating()
        
        
        if (error != nil){
            //handel errors here
            
            self.loginButton.isHidden = false
            
            aivLoadingSpinner.stopAnimating()
            
        }
        else if (result.isCancelled){
            
            //handel canceled event
            
            self.loginButton.isHidden = false
            
            aivLoadingSpinner.stopAnimating()
            
            
            
        }
            
        else {
            
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                print ("user is logged in to firebase now")
            }

            
        }


    }

    
    let loginButton: FBSDKLoginButton = {
        
        let faceBookButt = FBSDKLoginButton()
        
     
        
        faceBookButt.currentTitle
        faceBookButt.translatesAutoresizingMaskIntoConstraints = false
        return faceBookButt
    }()
    
    var progressThing: AnyObject?
    
    let inputsContainerView: UIView = {
        
        let view = UIView()
    view.backgroundColor = UIColor.white
    
   view.translatesAutoresizingMaskIntoConstraints = false
        
   view.layer.cornerRadius = 5
    view.layer.masksToBounds = true
    
        return view
    
    }()
    
    let nameTextField: UITextField = {
    
    let tf = UITextField()
        
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let  nameSeparatorView: UIView = {
    
        let view = UIView()
        view.backgroundColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    let emailTextField: UITextField = {
        
        let tf = UITextField()
        
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
        let  emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    var inputsContainerViewYPostionAnchor: NSLayoutConstraint?
    
    lazy var loginRegisterButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.setTitle("Register", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
    
        return button
        
    }()
    
    lazy var profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "addtext_com_MTgzMTQwMTI3NTg3.png")?.circleMasked
        
        
        
        
        
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        
        
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        
        let sc = UISegmentedControl(items: ["Login", "Register"])
        
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        sc.backgroundColor = .white
        sc.selectedSegmentIndex = 1
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        
        return sc
    }()
    
    
    lazy var passWordResetButt: UIButton = {
        
        let passButt = UIButton()
        passButt.setTitle("Reset Password", for: UIControlState())
        passButt.addTarget(self, action: #selector(handlePasswordReset), for: .touchUpInside)
        return passButt
        
    }()
    
    func setupFacebookButtonView(){
       
        if modelName == Devices.Simulator{
        
        
            self.loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 165).isActive = true
            self.loginButton.widthAnchor.constraint(equalTo:view.widthAnchor, constant: -24).isActive = true
            self.loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -686).isActive = true
            

        
        
        }
        
        
        
        if  modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus{
        
        //self.loginButton.topAnchor.constraint(equalTo: self.loginRegisterButton.bottomAnchor, constant: 5).isActive = true
        self.loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 165).isActive = true
        self.loginButton.widthAnchor.constraint(equalTo:view.widthAnchor, constant: -24).isActive = true
        self.loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -686).isActive = true
            
        }
        
       
        
       if modelName == Devices.IPhone5 || modelName == Devices.IPhone4 || modelName == Devices.IPhone5S || modelName == Devices.IPhone5C{
            
            //self.loginButton.topAnchor.constraint(equalTo: self.loginRegisterButton.bottomAnchor, constant: 5).isActive = true
            self.loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170).isActive = true
            self.loginButton.widthAnchor.constraint(equalTo:view.widthAnchor, constant: -24).isActive = true
            self.loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -520).isActive = true
            
        }
        
        if modelName == Devices.IPhoneSE{
        
            self.loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170).isActive = true
            self.loginButton.widthAnchor.constraint(equalTo:view.widthAnchor, constant: -24).isActive = true
            self.loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -520).isActive = true
        
            
        }
        
        
        
        if modelName == Devices.IPhone7 {
        
        
            self.loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170).isActive = true
            self.loginButton.widthAnchor.constraint(equalTo:view.widthAnchor, constant: -24).isActive = true
            self.loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -620).isActive = true
            
        
        }
        
        
        if modelName == Devices.IPhone6 || modelName == Devices.IPhone6S{
        
            self.loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170).isActive = true
            self.loginButton.widthAnchor.constraint(equalTo:view.widthAnchor, constant: -24).isActive = true
            self.loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -620).isActive = true
            

        
        
        }
        
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2{
        
            self.loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 165).isActive = true
            self.loginButton.widthAnchor.constraint(equalTo:view.widthAnchor, constant: -24).isActive = true
            self.loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -975).isActive = true
        
        
        }
        
        
        if modelName == Devices.Other {
        
            
            self.loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 165).isActive = true
            self.loginButton.widthAnchor.constraint(equalTo:view.widthAnchor, constant: -24).isActive = true
            self.loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -975).isActive = true
            
        
        }
        
        
      }
    
    func setupInputsContainerView(){
    
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
            inputsContainerViewHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        
        //need x,y, width, height constraints
        
        
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        
       nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        
        nameTextFieldHeightAnchor =
            nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
      nameTextFieldHeightAnchor?.isActive = true
        
        
        //need x,y, width, height constraints
        
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
        
        //need x,y, width, height constraints
        
        
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        
        emailTextFieldHeightAnchor?.isActive = true
        
        
        //need x,y, width, height constraints
        
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
        //need x,y, width, height constraints
        
        
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        
        passwordTextFieldHeightAnchor?.isActive = true

    
    }
    
    
    func setupLoginRegisterButton(){
        //need x,y, width, height constraints
        
        self.loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor,constant: 10).isActive = true
        self.loginRegisterButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 110
        ).isActive = true
        self.loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        self.loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.loginRegisterButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginRegisterButton.layer.cornerRadius = 5
        loginRegisterButton.layer.masksToBounds = true
    
    
    }
    
    
    
    func setupProfileImageView() {
       
       // let myDevice = Devices.IPhone5
        
        if modelName == Devices.IPhone7Plus || modelName == Devices.IPhone6Plus || modelName == Devices.IPhone6SPlus{
        
        
        //need x, y, width, height constraints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-250).isActive = true
        
        
        profileImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        }
        
        
        
        
        if modelName == Devices.IPhone5 || modelName == Devices.IPhone5S || modelName == Devices.IPhone6S || modelName == Devices.IPhone5C || modelName == Devices.IPhone6 || modelName == Devices.IPhone6S || modelName == Devices.IPhone7 || modelName == Devices.IPhoneSE{
            
            
            
            //need x, y, width, height constraints
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-200).isActive = true
            
            
            profileImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
            profileImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
            
        }
        
        if modelName == Devices.IPadAir || modelName == Devices.IPad2 || modelName == Devices.IPad3 || modelName == Devices.IPad4 || modelName == Devices.IPadAir2 || modelName == Devices.IPadPro || modelName == Devices.IPadMini || modelName == Devices.IPadMini2{
        
            //need x, y, width, height constraints
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-250).isActive = true
            
            
            profileImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
            profileImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
            
        }

        if modelName == Devices.Other{
        
        
        
            //need x, y, width, height constraints
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -30).isActive = true
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-250).isActive = true
            
            
            profileImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
            profileImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
            
            
            

            
        }
        
        
        
    }
    
    
    func setupPassRestButt(){
        
        
        passWordResetButt.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        passWordResetButt.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 210).isActive = true
        
        // passWordResetButt.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 2).isActive = true
        
        //passWordResetButt.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        
        passWordResetButt.translatesAutoresizingMaskIntoConstraints = false
        
        passWordResetButt.layer.cornerRadius = 5
        
        passWordResetButt.layer.masksToBounds = true
        
        passWordResetButt.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //passWordResetButt.backgroundColor = .red
        
        
    }
    
    
    
    func setupLoginRegisterSegmentedControl() {
        
        
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        
        loginRegisterSegmentedControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:-100).isActive = true
        
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //loginRegisterSegmentedControl.backgroundColor = .white
        
        loginRegisterSegmentedControl.layer.cornerRadius = 5
        loginRegisterSegmentedControl.layer.masksToBounds = true
        
        
        
    }
    
    
       func handleLoginRegister(){
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
        
            handleLogin()
            
            
        } else {
        
            handleRegister()
        
        }
    
    
    }
    
  
    func handleSelectProfileImageView() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            profileImageView.image = selectedImage.circleMasked
            
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
   
    
    func handleLogin(){
    
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print ("Form is not valid")
            
            return
        
        }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
            
                print (error)
                
                
                
                
                    
                    
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                    return
                    
                    
                
                
                return
            
            
            }
            
           
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            
            let homeViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeView")
            
            self.present(homeViewController, animated: true, completion: nil)
        })
    
    }
    
    // This function handles registration through email
    func handleRegister() {
        
        
        guard let email = emailTextField.text as String!, let password = passwordTextField.text as String!, let name = nameTextField.text as String! else{
            print ("Form is not valid")
            
            return
        
        
        }
        
        
        
        if profileImageView.image == UIImage(named: "addtext_com_MTgzMTQwMTI3NTg3.png"){
        
        
        
            let alert = UIAlertController(title: "Error", message: "You must choose a profile Picture!", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        
        
            
        
        }
            
        else if self.nameTextField.text == ""{
            
            
            let alert = UIAlertController(title: "Error", message: "You must enter a user name", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
            return
            
            
        }
        
        else{
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (
            user: FIRUser?, error) in
            
            if error != nil {
            
                print(error)
                
                
                
                
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                

                
                return
            
            
            
            }
            
            
            guard let uid = FIRAuth.auth()?.currentUser?.uid as String? else {
                return
                
            }
            
            
            let profilePicRef = FIRStorage.storage().reference().child( uid+"/profile_pic.jpg")
            
            
            
            
            
            if let uploadData = UIImageJPEGRepresentation(self.profileImageView.image!,0.25){
                
                self.aivLoadingSpinner.startAnimating()
                
                let TestingVar = profilePicRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    if error != nil {
                        print(error)
                        return
                        
                    }
                    
                    
                    
                    
                    if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                        
                        
                        let values = ["email": self.emailTextField.text! as String, "name": self.nameTextField.text! as String, "profileImageUrl": profileImageUrl]
                        
                        let ref = FIRDatabase.database().reference()
                        let usersReference = ref.child("users").child(FIRAuth.auth()?.currentUser?.uid as String!)
                        
                        
                        
                        
                        usersReference.updateChildValues(values, withCompletionBlock: { (err, usersReference) in
                            
                            if err != nil {
                                
                                print(err)
                                
                                return
                            }
                            
                            
                            
                            
                            
                            print("saved user successfully in to firebase db")
                            
                            self.aivLoadingSpinner.stopAnimating()
                            
                            
                            
                            
                            
                              DispatchQueue.main.async(execute: {
                             let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
                             
                             let homeViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeView")
                             
                             self.present(homeViewController, animated: true, completion: nil)
                             })
                            
                            
                            
                            
                        })
                        
                    }
                    
                    print(metadata)
                    
                    
                    
                })
                
                let observer = TestingVar.observe(.progress, handler: { (snapshot) in
                    print(snapshot.progress)
                    
                    if snapshot.status == .success {
                        
                        
                       
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
                        
                        let homeViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeView")
                        
                        self.present(homeViewController, animated: true, completion: nil)
                        
                       

                        
                    }
                    
                })
            }
          
            
        
            print ("User Succesfully Registered!")
         
        })
        }
    
    }
    
  
    @IBOutlet weak var aivLoadingSpinner: UIActivityIndicatorView!

 
    
    
    
   
    
    
    
    func handlePasswordReset(){
        
        if emailTextField.text == "" {
        
            let alert = UIAlertController(title: "Error", message: "the email for the account is needed you cannot leave the field blank", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        
        
        
        return
        
        }
        
        FIRAuth.auth()?.sendPasswordReset(withEmail: emailTextField.text!, completion: { (error) in
            
            if error != nil {
            
            
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
                return
                

            
            }
            
            
            
            let alert = UIAlertController(title: "Error", message: "an email has been sent", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            

            
        })
    
    
    
    }
    
    
    
  
    
    func handleLoginRegisterChange(){
        
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: UIControlState())
        
        // change height of inputContainerView, but how???
        inputsContainerViewHeightAnchor?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        // change height of nameTextField
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0{
        
            nameTextField.placeholder = ""
        
        
        }
        else{
        
            nameTextField.placeholder = "Name"
        }
       
        
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHeightAnchor?.isActive = true
        
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor?.isActive = true

    
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.nameTextField.delegate = self
        self.passwordTextField.delegate = self
        self.emailTextField.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
         UIApplication.shared.statusBarStyle = .lightContent
        //Looks for single or multiple taps.
        //let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        setupKeyboardObservers()
        
       // view.addGestureRecognizer(tap)
        
      view.addSubview(profileImageView)
      view.addSubview(loginRegisterSegmentedControl)
      view.addSubview(inputsContainerView)
      view.addSubview(loginRegisterButton)
      
      view.addSubview(loginButton)
       
      view.addSubview(passWordResetButt)
      view.addSubview(aivLoadingSpinner)
    
        
        setupProfileImageView()
        setupLoginRegisterSegmentedControl()
       setupInputsContainerView()
        setupLoginRegisterButton()
        setupFacebookButtonView()
       
       
        setupPassRestButt()
        
        if FIRAuth.auth()?.currentUser?.uid != nil {
        
        let alreadySignedIn = FIRDatabase.database().reference().child("users").child(FIRAuth.auth()?.currentUser?.uid as String!)
        
        alreadySignedIn.observe(.value, with: { (snapshot) in
            
            if snapshot.value != nil {
                
                
                if let dictionary = snapshot.value as? [String: AnyObject]{
                    
                    
                    let check = CheckUser()
                    
                    check.setValuesForKeys(dictionary)
                    
                    
                    if check.name as String! != "" && check.email as String! != "" && check.profileImageUrl as String! != "" {
                        
                        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
                        
                        let homeViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeView")
                        
                        self.present(homeViewController, animated: true, completion: nil)
                        
                        
                    }
         
                    
                }
           
            }
            
            }, withCancel: nil)
        

        
        }
        
        
        
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if let user = user {
                // User is signed in.
                //want to move user to another screen
                
                if let providerData = FIRAuth.auth()?.currentUser?.providerData {
                    for userInfo in providerData {
                        switch userInfo.providerID {
                        case "facebook.com":
                            print("user is signed in with facebook")
                            
                            
                            
                            let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
                            
                            let homeViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeView")
                            
                            self.present(homeViewController, animated: true, completion: nil)
                        default:
                            
                            
                            print("user is signed in with \(userInfo.providerID)")
                            
                            
                            
                            
                        }
                    }
                    
                }
                
                
                
            }
            else {
                // No user is signed in.
                //show user login button
                
                
                // Optional: Place the button in the center of your view.
                //self.loginButton.center = self.view.center
                
                self.loginButton.readPermissions = ["public_profile", "email"]
                self.loginButton.delegate = self;
                //self.view!.addSubview(self.loginButton)
                
                self.loginButton.isHidden = false
                
                
                
                
            }
        }
        
        
       
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func handleKeyboardWillShow(_ notification: Notification) {
        let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        
        
       self.view.frame.origin.y = -(keyboardFrame?.height)!
        UIView.animate(withDuration: keyboardDuration!, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func handleKeyboardWillHide(_ notification: Notification) {
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        
        print("I am free!")
        
        
       self.view.frame.origin.y = 0
        UIView.animate(withDuration: keyboardDuration!, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }

    
    
    /*func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        
        
        
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.endEditing(true)
    } */
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print ("user did log out")
    }


}

