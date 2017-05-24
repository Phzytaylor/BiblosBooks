//
//  UploadViewController.swift
//  biblos
//
//  Created by Taylor Simpson on 6/9/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import CoreLocation


let manager = CLLocationManager()





class UploadViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate, UITextFieldDelegate {
    @IBOutlet weak var chooseAPicLabel: UILabel!
    
    @IBOutlet weak var upLoadButton: UIButton!
    
    @IBOutlet weak var AgeRestrictedLabel: UILabel!
    
    @IBOutlet weak var allAgeLabel: UILabel!
    var userPushID = ""
    var bookRating = "Age Restricted"
    
    var usersBookLoc: CLLocationCoordinate2D!
    
    var userLoc:CLLocationCoordinate2D!{
        
        didSet{
            
            
            
            usersBookLoc = userLoc
            
            print("This is the users loc\(usersBookLoc)")
            
            
            
           
            
            
            
        }
        
        
        
    }
    
    // These two vars are used for email login
    var usersName: String!
    var usersPhoto: String!
    
    var usersPhotoChoice: String!
    
    
    
    
    @IBAction func buttonClicked(_ sender: AnyObject) {
        
        
        
        if mySwitch.isOn {
            bookRating = "Age Restricted"
            print("Switch is on")
            
            //print(bookRating)
            mySwitch.setOn(true, animated:true)
        } else {
            bookRating = "All Ages"
            
            print("Switch is off")
            
            //print(bookRating)
            mySwitch.setOn(false, animated:true)
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        userLoc = myLocation
    }
    
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var locationField: UITextField!
    
    
    var genrePicker = UIPickerView()
    
    
    
    
    var imagePicker: UIImagePickerController!
    
    var genreArray = ["DRAMA","CLASSIC,COMIC/GRAPHIC NOVEL","CRIME/DETECTIVE","FABLE,FAIRY TALE","FANTASY","FICTION NARRATIVE", "FICTION IN VERSE","FOLKLORE","HISTORICAL FICTION","HORROR","HUMOUR","LEGEMD","MAGICAL REALISM","METAFICTION","MYSTERY","MYTHOLOGY","MYTHOPOEIA","REALISTIC FICTION","SCIENCE FICTION","SHORT STORY","SUSPENSE/THRILLER","TALL TALE","WESTERN,BIOGRAPHY","AUTOBIOGRAPHY","ESSAY","NARRATIVE", "NONFICTION/PERSONAL NARRATIVE","MEMOIR","SPEECH","TEXTBOOK","REFERENCE BOOK","SELF-HELP BOOK","JOURNALISM", "RELIGON","MANGA","GENERAL AGRICULTURE","AGRICULTURE PRODUCTION AND MANAGEMENT",
                      "AGRICULTURAL ECONOMICS","ANIMAL SCIENCES", "FOOD SCIENCE","PLANT SCIENCE AND AGRONOMY","SOIL SCIENCE", "MISCELLANEOUS AGRICULTURE",
                      "FORESTRY",
                      "NATURAL RESOURCES MANAGEMENT", "FINE ARTS", "DRAMA AND THEATER ARTS", "MUSIC",
                      "VISUAL AND PERFORMING ARTS",
                      "COMMERCIAL ART AND GRAPHIC DESIGN",
                      "FILM VIDEO AND PHOTOGRAPHIC ARTS",
                      "STUDIO ARTS",
                      "MISCELLANEOUS FINE ARTS",
                      "ENVIRONMENTAL SCIENCE",
                      "BIOLOGY",
                      "BIOCHEMICAL SCIENCES",
                      "BOTANY",
                      "MOLECULAR BIOLOGY",
                      "ECOLOGY",
                      "GENETICS",
                      "MICROBIOLOGY",
                      "PHARMACOLOGY",
                      "PHYSIOLOGY",
                      "ZOOLOGY",
                      "NEUROSCIENCE",
                      "MISCELLANEOUS BIOLOGY",
                      "COGNITIVE SCIENCE AND BIOPSYCHOLOGY",
                      "GENERAL BUSINESS",
                      "ACCOUNTING",
                      "ACTUARIAL SCIENCE",
                      "BUSINESS MANAGEMENT AND ADMINISTRATION",
                      "OPERATIONS LOGISTICS AND E-COMMERCE",
                      "BUSINESS ECONOMICS",
                      "MARKETING AND MARKETING RESEARCH",
                      "FINANCE",
                      "HUMAN RESOURCES AND PERSONNEL MANAGEMENT",
                      "INTERNATIONAL BUSINESS",
                      "HOSPITALITY MANAGEMENT",
                      "MANAGEMENT INFORMATION SYSTEMS AND STATISTICS",
                      "MISCELLANEOUS BUSINESS & MEDICAL ADMINISTRATION",
                      "COMMUNICATIONS",
                      "JOURNALISM",
                      "MASS MEDIA",
                      "ADVERTISING AND PUBLIC RELATIONS",
                      "COMMUNICATION TECHNOLOGIES",
                      "COMPUTER AND INFORMATION SYSTEMS",
                      "COMPUTER PROGRAMMING AND DATA PROCESSING",
                      "COMPUTER SCIENCE",
                      "INFORMATION SCIENCES",
                      "COMPUTER ADMINISTRATION MANAGEMENT AND SECURITY",
                      "COMPUTER NETWORKING AND TELECOMMUNICATIONS",
                      "MATHEMATICS",
                      "APPLIED MATHEMATICS",
                      "STATISTICS AND DECISION SCIENCE",
                      "MATHEMATICS AND COMPUTER SCIENCE",
                      "GENERAL EDUCATION",
                      "EDUCATIONAL ADMINISTRATION AND SUPERVISION",
                      "SCHOOL STUDENT COUNSELING",
                      "ELEMENTARY EDUCATION",
                      "MATHEMATICS TEACHER EDUCATION",
                      "PHYSICAL AND HEALTH EDUCATION TEACHING",
                      "EARLY CHILDHOOD EDUCATION",
                      "SCIENCE AND COMPUTER TEACHER EDUCATION",
                      "SECONDARY TEACHER EDUCATION",
                      "SPECIAL NEEDS EDUCATION",
                      "SOCIAL SCIENCE OR HISTORY TEACHER EDUCATION",
                      "TEACHER EDUCATION: MULTIPLE LEVELS",
                      "LANGUAGE AND DRAMA EDUCATION",
                      "ART AND MUSIC EDUCATION",
                      " MISCELLANEOUS EDUCATION",
                      "LIBRARY SCIENCE",
                      "ARCHITECTURE",
                      "GENERAL ENGINEERING",
                      "AEROSPACE ENGINEERING",
                      "BIOLOGICAL ENGINEERING",
                      "ARCHITECTURAL ENGINEERING",
                      "BIOMEDICAL ENGINEERING",
                      "CHEMICAL ENGINEERING",
                      "CIVIL ENGINEERING",
                      "COMPUTER ENGINEERING",
                      "ELECTRICAL ENGINEERING",
                      "ENGINEERING MECHANICS PHYSICS AND SCIENCE",
                      "ENVIRONMENTAL ENGINEERING",
                      "GEOLOGICAL AND GEOPHYSICAL ENGINEERING",
                      "INDUSTRIAL AND MANUFACTURING ENGINEERING",
                      "MATERIALS ENGINEERING AND MATERIALS SCIENCE",
                      "MECHANICAL ENGINEERING",
                      "METALLURGICAL ENGINEERING",
                      "MINING AND MINERAL ENGINEERING",
                      "NAVAL ARCHITECTURE AND MARINE ENGINEERING",
                      "NUCLEAR ENGINEERING",
                      "PETROLEUM ENGINEERING",
                      "MISCELLANEOUS ENGINEERING",
                      "ENGINEERING TECHNOLOGIES",
                      "ENGINEERING AND INDUSTRIAL MANAGEMENT",
                      "ELECTRICAL ENGINEERING TECHNOLOGY",
                      "INDUSTRIAL PRODUCTION TECHNOLOGIES",
                      "MECHANICAL ENGINEERING RELATED TECHNOLOGIES",
                      "MISCELLANEOUS ENGINEERING TECHNOLOGIES",
                      "MATERIALS SCIENCE",
                      "NUTRITION SCIENCES",
                      "GENERAL MEDICAL AND HEALTH SERVICES",
                      "COMMUNICATION DISORDERS SCIENCES AND SERVICES",
                      "HEALTH AND MEDICAL ADMINISTRATIVE SERVICES",
                      "MEDICAL ASSISTING SERVICES",
                      "MEDICAL TECHNOLOGIES TECHNICIANS",
                      "HEALTH AND MEDICAL PREPARATORY PROGRAMS",
                      "NURSING",
                      "PHARMACY PHARMACEUTICAL SCIENCES AND ADMINISTRATION",
                      "TREATMENT THERAPY PROFESSIONS",
                      "COMMUNITY AND PUBLIC HEALTH",
                      "MISCELLANEOUS HEALTH MEDICAL PROFESSIONS",
                      "AREA ETHNIC AND CIVILIZATION STUDIES",
                      "LINGUISTICS AND COMPARATIVE LANGUAGE AND LITERATURE",
                      "FRENCH GERMAN LATIN AND OTHER COMMON FOREIGN LANGUAGE STUDIES",
                      "OTHER FOREIGN LANGUAGES",
                      "ENGLISH LANGUAGE AND LITERATURE",
                      "COMPOSITION AND RHETORIC",
                      "LIBERAL ARTS",
                      "HUMANITIES",
                      "INTERCULTURAL AND INTERNATIONAL STUDIES",
                      "PHILOSOPHY AND RELIGIOUS STUDIES",
                      "THEOLOGY AND RELIGIOUS VOCATIONS",
                      "ANTHROPOLOGY AND ARCHEOLOGY",
                      "ART HISTORY AND CRITICISM",
                      "HISTORY",
                      "UNITED STATES HISTORY",
                      "COSMETOLOGY SERVICES AND CULINARY ARTS",
                      "FAMILY AND CONSUMER SCIENCES",
                      "MILITARY TECHNOLOGIES",
                      "PHYSICAL FITNESS PARKS RECREATION AND LEISURE",
                      "CONSTRUCTION SERVICES",
                      "ELECTRICAL, MECHANICAL, AND PRECISION TECHNOLOGIES AND PRODUCTION",
                      "TRANSPORTATION SCIENCES AND TECHNOLOGIES",
                      "MULTI/INTERDISCIPLINARY STUDIES",
                      "COURT REPORTING",
                      "PRE-LAW AND LEGAL STUDIES",
                      "CRIMINAL JUSTICE AND FIRE PROTECTION",
                      "PUBLIC ADMINISTRATION",
                      "PUBLIC POLICY",
                      "PHYSICAL SCIENCES",
                      "ASTRONOMY AND ASTROPHYSICS",
                      "ATMOSPHERIC SCIENCES AND METEOROLOGY",
                      "CHEMISTRY",
                      "GEOLOGY AND EARTH SCIENCE",
                      "GEOSCIENCES",
                      "OCEANOGRAPHY",
                      "PHYSICS",
                      "MULTI-DISCIPLINARY OR GENERAL SCIENCE",
                      "NUCLEAR, INDUSTRIAL RADIOLOGY, AND BIOLOGICAL TECHNOLOGIES",
                      "PSYCHOLOGY",
                      "EDUCATIONAL PSYCHOLOGY",
                      "CLINICAL PSYCHOLOGY",
                      "COUNSELING PSYCHOLOGY",
                      "INDUSTRIAL AND ORGANIZATIONAL PSYCHOLOGY",
                      "SOCIAL PSYCHOLOGY",
                      "MISCELLANEOUS PSYCHOLOGY",
                      "HUMAN SERVICES AND COMMUNITY ORGANIZATION",
                      "SOCIAL WORK",
                      "INTERDISCIPLINARY SOCIAL SCIENCES",
                      "GENERAL SOCIAL SCIENCES",
                      "ECONOMICS",
                      "CRIMINOLOGY",
                      "GEOGRAPHY",
                      "INTERNATIONAL RELATIONS",
                      "POLITICAL SCIENCE AND GOVERNMENT",
                      "SOCIOLOGY",
                      "MISCELLANEOUS SOCIAL SCIENCES"].sorted()
    @IBOutlet weak var bookPic: UIImageView!
    
    
 
    
    
    @IBOutlet weak var bookTitle: UITextField!
    
    @IBOutlet weak var bookAuthor: UITextField!
    
    @IBOutlet weak var bookGenre: UITextField!
    
    @IBOutlet weak var bookComment: UITextField!
    
    
    
    
    
    @IBAction func testButton(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "gooo", sender: sender)
        
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genreArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genreArray.count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        bookGenre.text = genreArray[row]
        
    }
    
    @IBAction func bookUpload(_ sender: AnyObject) {
        
        manager.startUpdatingLocation()
        
        
        
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                print("No access")
                
                let lat : NSNumber = NSNumber(value: -82.862752)
                
                let latString:String = String (format: "%f", lat.doubleValue)
                
                let lng : NSNumber = NSNumber(value: 135.000000)
                
                let lngString:String = String (format: "%f", lng.doubleValue)
                
                
                
                if(bookPic == nil || bookTitle.text == "" || bookAuthor.text == "" || bookGenre.text == "" || bookComment.text == "" || locationField.text == "") {
                    
                    
                    // create the alert
                    let alert = UIAlertController(title: "Error", message: "You must fill out all fields and have a picture", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                }else{
                    
                    let storage = FIRStorage.storage()
                    
                    
                    // Create a storage reference from our storage service
                    
                    let storageRef = storage.reference(forURL: "gs://biblos-1.appspot.com")
                    
                    
                    let user = FIRAuth.auth()?.currentUser
                    var name = user!.displayName
                    
                    if user!.displayName == nil{
                        
                        
                        
                        print(self.usersName)
                        
                        
                        name = self.usersName
                        
                        
                    }
                    
                    var imageData = Data()
                    
                    
                    
                    imageData = UIImageJPEGRepresentation(imagePicked.image!,0.25)!
                    
                    if FIRAuth.auth()?.currentUser?.photoURL?.absoluteString == nil {
                        
                        
                        usersPhotoChoice = usersPhoto
                        
                        
                    } else{
                        
                        usersPhotoChoice = FIRAuth.auth()?.currentUser?.photoURL?.absoluteString
                        
                        
                    }
                    
                    
                    let booksImageref = storageRef.child("book_images")
                    
                    let filePath =  ("/biblos-1.appspot.com/bookPhoto"+bookTitle.text!+(FIRAuth.auth()?.currentUser?.uid as String!))
                    
                    let metaData = FIRStorageMetadata()
                    
                    metaData.contentType = "image/jpg"
                    
                    storageRef.child(filePath).put(imageData, metadata: metaData){(metaData,error) in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        }else{
                            //store downloadURL
                            let downloadURL = metaData!.downloadURL()!.absoluteString
                            //store downloadURL at database
                            
                            
                            
                            let ref = FIRDatabase.database().reference().child("books")
                            
                            let childRef = ref.childByAutoId()
                            
                            let id = FIRAuth.auth()?.currentUser?.uid as String!
                            
                            //Taylor you have to do a check for the user photo here, if they are using facebook this is fine, but if they use email and password you need can't just grab the users photo :(
                            
                            
                            let books = ["title": self.bookTitle.text!,
                                         "Author":self.bookAuthor.text!,
                                         "Genre": self.bookGenre.text!,
                                         "Comment": self.bookComment.text!,
                                         "User": name!,
                                         "bookPhoto": downloadURL,
                                         "userID": FIRAuth.auth()?.currentUser?.uid as AnyObject!,
                                         "userPhoto": self.usersPhotoChoice as String!,
                                         "userLocation": self.locationField.text!,
                                         "bookRating": self.bookRating,
                                         "pushingID": self.userPushID,
                                         "bookLat": latString,
                                         "bookLng": lngString
                                ] as [String : Any]
                            
                            
                            
                            childRef.updateChildValues(books){(error,ref) in
                                
                                if error != nil {
                                    
                                    print(error)
                                    
                                    return
                                    
                                }
                                
                                
                                
                                let userBooksRef = FIRDatabase.database().reference().child("user-books").child(id!)
                                
                                
                                
                                
                                let bookId = childRef.key
                                
                                userBooksRef.updateChildValues([bookId : 1])
                                
                                
                                
                            }
                            
                            self.imagePicked.image = nil
                            self.bookGenre.text = nil
                            self.bookComment.text = nil
                            self.bookAuthor.text = nil
                            self.bookTitle.text = nil
                            self.locationField.text = nil
                            
                            manager.stopUpdatingLocation()
                            
                            
                        }
                        
                    }
                    
                    
                    
                    
                    
                    // create the alert
                    let alert = UIAlertController(title: "Uploaded", message: "Your book has been uploaded", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                    
                    
                }

                
                
                
                

                
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                
                let lat : NSNumber = NSNumber(value:(manager.location?.coordinate.latitude)!)
                
                let latString:String = String (format: "%f", lat.doubleValue)
                
                let lng : NSNumber = NSNumber(value: (manager.location?.coordinate.longitude)!)
                
                let lngString:String = String (format: "%f", lng.doubleValue)
                
                
                
                
                
                if(bookPic == nil || bookTitle.text == "" || bookAuthor.text == "" || bookGenre.text == "" || bookComment.text == "" || locationField.text == "") {
                    
                    
                    // create the alert
                    let alert = UIAlertController(title: "Error", message: "You must fill out all fields and have a picture", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                }else{
                    
                    let storage = FIRStorage.storage()
                    
                    
                    // Create a storage reference from our storage service
                    
                    let storageRef = storage.reference(forURL: "gs://biblos-1.appspot.com")
                    
                    
                    let user = FIRAuth.auth()?.currentUser
                    var name = user!.displayName
                    
                    if user!.displayName == nil{
                        
                        
                        
                        print(self.usersName)
                        
                        
                        name = self.usersName
                        
                        
                    }
                    
                    var imageData = Data()
                    
                    
                    
                    imageData = UIImageJPEGRepresentation(imagePicked.image!,0.25)!
                    
                    if FIRAuth.auth()?.currentUser?.photoURL?.absoluteString == nil {
                        
                        
                        usersPhotoChoice = usersPhoto
                        
                        
                    } else{
                        
                        usersPhotoChoice = FIRAuth.auth()?.currentUser?.photoURL?.absoluteString
                        
                        
                    }
                    
                    
                    let booksImageref = storageRef.child("book_images")
                    
                    let filePath =  ("/biblos-1.appspot.com/bookPhoto"+bookTitle.text!+(FIRAuth.auth()?.currentUser?.uid as String!))
                    
                    let metaData = FIRStorageMetadata()
                    
                    metaData.contentType = "image/jpg"
                    
                    storageRef.child(filePath).put(imageData, metadata: metaData){(metaData,error) in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        }else{
                            //store downloadURL
                            let downloadURL = metaData!.downloadURL()!.absoluteString
                            //store downloadURL at database
                            
                            
                            
                            let ref = FIRDatabase.database().reference().child("books")
                            
                            let childRef = ref.childByAutoId()
                            
                            let id = FIRAuth.auth()?.currentUser?.uid as String!
                            
                            //Taylor you have to do a check for the user photo here, if they are using facebook this is fine, but if they use email and password you need can't just grab the users photo :(
                            
                            
                            let books = ["title": self.bookTitle.text!,
                                         "Author":self.bookAuthor.text!,
                                         "Genre": self.bookGenre.text!,
                                         "Comment": self.bookComment.text!,
                                         "User": name!,
                                         "bookPhoto": downloadURL,
                                         "userID": FIRAuth.auth()?.currentUser?.uid as AnyObject!,
                                         "userPhoto": self.usersPhotoChoice as String!,
                                         "userLocation": self.locationField.text!,
                                         "bookRating": self.bookRating,
                                         "pushingID": self.userPushID,
                                         "bookLat": latString,
                                         "bookLng": lngString
                                ] as [String : Any]
                            
                            
                            
                            childRef.updateChildValues(books){(error,ref) in
                                
                                if error != nil {
                                    
                                    print(error)
                                    
                                    return
                                    
                                }
                                
                                
                                
                                let userBooksRef = FIRDatabase.database().reference().child("user-books").child(id!)
                                
                                
                                
                                
                                let bookId = childRef.key
                                
                                userBooksRef.updateChildValues([bookId : 1])
                                
                                
                                
                            }
                            
                            self.imagePicked.image = nil
                            self.bookGenre.text = nil
                            self.bookComment.text = nil
                            self.bookAuthor.text = nil
                            self.bookTitle.text = nil
                            self.locationField.text = nil
                            
                            self.chooseAPicLabel.isHidden = false
                            
                            
                            manager.stopUpdatingLocation()
                            
                            
                        }
                        
                    }
                    
                    
                    
                    
                    
                    // create the alert
                    let alert = UIAlertController(title: "Uploaded", message: "Your book has been uploaded", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                    
                    
                }

                
                

            }
        } else {
            print("Location services are not enabled")
            
            
            let lat : NSNumber = NSNumber(value: -82.862752)
            
            let latString:String = String (format: "%f", lat.doubleValue)
            
            let lng : NSNumber = NSNumber(value: 135.000000)
            
            let lngString:String = String (format: "%f", lng.doubleValue)
            
            if(bookPic == nil || bookTitle.text == "" || bookAuthor.text == "" || bookGenre.text == "" || bookComment.text == "" || locationField.text == "") {
                
                
                // create the alert
                let alert = UIAlertController(title: "Error", message: "You must fill out all fields and have a picture", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
                
                
            }else{
                
                let storage = FIRStorage.storage()
                
                
                // Create a storage reference from our storage service
                
                let storageRef = storage.reference(forURL: "gs://biblos-1.appspot.com")
                
                
                let user = FIRAuth.auth()?.currentUser
                var name = user!.displayName
                
                if user!.displayName == nil{
                    
                    
                    
                    print(self.usersName)
                    
                    
                    name = self.usersName
                    
                    
                }
                
                var imageData = Data()
                
                
                
                imageData = UIImageJPEGRepresentation(imagePicked.image!,0.25)!
                
                if FIRAuth.auth()?.currentUser?.photoURL?.absoluteString == nil {
                    
                    
                    usersPhotoChoice = usersPhoto
                    
                    
                } else{
                    
                    usersPhotoChoice = FIRAuth.auth()?.currentUser?.photoURL?.absoluteString
                    
                    
                }
                
                
                let booksImageref = storageRef.child("book_images")
                
                let filePath =  ("/biblos-1.appspot.com/bookPhoto"+bookTitle.text!+(FIRAuth.auth()?.currentUser?.uid as String!))
                
                let metaData = FIRStorageMetadata()
                
                metaData.contentType = "image/jpg"
                
                storageRef.child(filePath).put(imageData, metadata: metaData){(metaData,error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }else{
                        //store downloadURL
                        let downloadURL = metaData!.downloadURL()!.absoluteString
                        //store downloadURL at database
                        
                        
                        
                        let ref = FIRDatabase.database().reference().child("books")
                        
                        let childRef = ref.childByAutoId()
                        
                        let id = FIRAuth.auth()?.currentUser?.uid as String!
                        
                        //Taylor you have to do a check for the user photo here, if they are using facebook this is fine, but if they use email and password you need can't just grab the users photo :(
                        
                        
                        let books = ["title": self.bookTitle.text!,
                                     "Author":self.bookAuthor.text!,
                                     "Genre": self.bookGenre.text!,
                                     "Comment": self.bookComment.text!,
                                     "User": name!,
                                     "bookPhoto": downloadURL,
                                     "userID": FIRAuth.auth()?.currentUser?.uid as AnyObject!,
                                     "userPhoto": self.usersPhotoChoice as String!,
                                     "userLocation": self.locationField.text!,
                                     "bookRating": self.bookRating,
                                     "pushingID": self.userPushID,
                                     "bookLat": latString,
                                     "bookLng": lngString
                            ] as [String : Any]
                        
                        
                        
                        childRef.updateChildValues(books){(error,ref) in
                            
                            if error != nil {
                                
                                print(error)
                                
                                return
                                
                            }
                            
                            
                            
                            let userBooksRef = FIRDatabase.database().reference().child("user-books").child(id!)
                            
                            
                            
                            
                            let bookId = childRef.key
                            
                            userBooksRef.updateChildValues([bookId : 1])
                            
                            
                            
                        }
                        
                        self.imagePicked.image = nil
                        self.bookGenre.text = nil
                        self.bookComment.text = nil
                        self.bookAuthor.text = nil
                        self.bookTitle.text = nil
                        self.locationField.text = nil
                        
                        manager.stopUpdatingLocation()
                        
                        
                    }
                    
                }
                
                
                
                
                
                // create the alert
                let alert = UIAlertController(title: "Uploaded", message: "Your book has been uploaded", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
                
                
                
                
            }

            
            
        }
        
         /* let lat : NSNumber = NSNumber(value:(manager.location?.coordinate.latitude)!)
        
        let latString:String = String (format: "%f", lat.doubleValue)
        
        let lng : NSNumber = NSNumber(value: (manager.location?.coordinate.longitude)!)
        
        let lngString:String = String (format: "%f", lng.doubleValue) */
        
        
        
        
        
    }
    
    
    
    
    
    
    @IBOutlet weak var imagePicked: UIImageView!
    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    
    let bookRef = FIRDatabase.database().reference().child("books")
 
    
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!) {
        imagePicked.image = image
        self.dismiss(animated: true, completion: nil);
        
        
    imagePicked.image = image
    
    
    chooseAPicLabel.isHidden = true
    
    
        /*switch picker.tag {
        case 1:
            var rotatedPhoto = imagePicked.image?.imageRotatedByDegrees(90, flip: false)
            
            rotatedPhoto = image
            
            
        default:
            imagePicked.image = image
        }*/
        
        
        
        
        
        
        
    }
    
    
  /*  @IBAction func takePhoto(_ sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            
            
            
            imagePicker.allowsEditing = false
            
            
            
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        
    } */
    
    
    
 /*   @IBAction func selectPhoto(_ sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
            
            
            
        }
        
        
        
        
    } */
    
    
    
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Upload Your Book"
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        
        
         self.tabBarController?.navigationItem.titleView = nil
        
        
        
        //self.view.backgroundColor = UIColor.purpleColor()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        imagePicked.image = nil
        
    }
    
    
    
    
    func didLogOut(){
        
        
        //signs user out of firebase app
        
        try! FIRAuth.auth()!.signOut()
        
        //sign user out of facebook app
        
        FBSDKAccessToken.setCurrent(nil)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        
        let viewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginView")
        
        self.present(viewController, animated: true, completion: nil)
        
        
        
        
    }
    
    
    
    
    func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
    }
    
    func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
   //- MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.bookTitle.delegate = self
        
        self.bookAuthor.delegate = self
        
         self.bookGenre.delegate = self
        
       self.bookComment.delegate = self
        
        bookPic.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pickCamorLib)))
        bookPic.isUserInteractionEnabled = true
        
       upLoadButton.layer.cornerRadius = 5
        
       
        AgeRestrictedLabel.layer.cornerRadius = 5
        
        allAgeLabel.layer.cornerRadius = 5
        
         UIApplication.shared.statusBarStyle = .lightContent
        manager.delegate = self
        
        manager.requestWhenInUseAuthorization()
        //manager.startUpdatingLocation()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
      self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        
        
        navigationController!.navigationBar.barTintColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
        let userIdForPic = FIRAuth.auth()?.currentUser?.uid as String!
        
        let nameRef = FIRDatabase.database().reference().child("users").child(userIdForPic!).child("name")
        
        
        nameRef.observeSingleEvent(of: .value, with: { (snapshot) in
            
            self.usersName = snapshot.value as! String!
            
            
            }, withCancel: nil)
        
        
        let picRef = FIRDatabase.database().reference().child("users").child(userIdForPic!).child("profileImageUrl")
        
        
        picRef.observeSingleEvent(of: .value, with: { (snapshot) in
            
            self.usersPhoto = snapshot.value as! String!
            
            }, withCancel: nil)
        
        OneSignal.idsAvailable({ (userId, pushToken) in
            self.userPushID = userId!
            if (pushToken != nil) {
                NSLog("pushToken:%@", pushToken ?? "")
            }
        })
        
        NotificationCenter.default.addObserver(self, selector: #selector(UploadViewController.keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(UploadViewController.keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        
        //picTaker.tag = 1
        
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UploadViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        genrePicker.delegate = self
        genrePicker.dataSource = self
        
        bookGenre.inputView = genrePicker
        
        
        
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didLogOut))
        
        tabBarController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    func pickCamorLib () {
    
        
        let refreshAlert = UIAlertController(title: "Upload", message: "Take a picure or select a photo.", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction!) in
           
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                
                
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
                
                
                
                imagePicker.allowsEditing = false
                
                
                
                
                self.present(imagePicker, animated: true, completion: nil)
                
                
                
                
                
            }
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction!) in
            
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
                
                self.imagePicker = UIImagePickerController()
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
                self.imagePicker.allowsEditing = false
                self.present(self.imagePicker, animated: true, completion: nil)
                
                
                
                
            }
            
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(refreshAlert, animated: true, completion: nil)
    
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
    
    
    
}
