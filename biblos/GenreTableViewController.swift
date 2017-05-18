//
//  GenreTableViewController.swift
//  biblos
//
//  Created by Taylor Simpson on 6/14/16.
//  Copyright © 2016 Taylor Simpson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FBSDKCoreKit
import BWWalkthrough


class GenreTableViewController: UITableViewController, UISearchBarDelegate, BWWalkthroughViewControllerDelegate{
    
    
    var needWalkthrough:Bool = true
    var walkthrough:BWWalkthroughViewController!
    
    
    let dataBase = FIRDatabase.database()
    
    var modelName = UIDevice.current.modelName
    
    
     let searchBar = UISearchBar()
    
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
            "MISCELLANEOUS SOCIAL SCIENCES"
].sorted()
    
    var filteredArray = [String]()
    var shouldShowSearchResults = false
    
    //Functions for adding search
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = genreArray.filter({ (genres: String) -> Bool in
        
        return (genres.lowercased().range(of: searchText.lowercased()) != nil)
            
        
        
        })
        
        if searchText != ""{
            
            shouldShowSearchResults = true
            
            self.tableView.reloadData()
        
        
        }
        else {
        
            shouldShowSearchResults = false
            
            self.tableView.reloadData()
        
        
        }
    }
    
    
    
    // End of functions for adding search
    
    
    var ResultArray: [NSObject] = []
    var infoArray:[AnyObject] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Select A Genre"
        
       
        //self.navigationItem.titleView = searchBar
        
        createSearchBar()
        
       
       
        
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
    
    func createSearchBar (){
    
       
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Select a Genre"
        searchBar.delegate = self
        self.tabBarController?.navigationItem.titleView = searchBar
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       tableView.backgroundView = UIImageView(image: UIImage(named: "nicelib.jpeg"))
        
         UIApplication.shared.statusBarStyle = .lightContent
        
       
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
        } else {
            print("First launch, setting UserDefault.")
            
            
            // Get view controllers and build the walkthrough
            let stb = UIStoryboard(name: "Main", bundle: nil)
            walkthrough = stb.instantiateViewController(withIdentifier: "walk") as! BWWalkthroughViewController
            let page_one = stb.instantiateViewController(withIdentifier: "page_1")
            let page_two = stb.instantiateViewController(withIdentifier: "page_2")
            let page_three = stb.instantiateViewController(withIdentifier: "page_3")
            let page_four = stb.instantiateViewController(withIdentifier: "page_4")
            let page_five = stb.instantiateViewController(withIdentifier: "page_5")
            let page_six = stb.instantiateViewController(withIdentifier: "page_6")
            let page_seven = stb.instantiateViewController(withIdentifier: "page_7")
            
            // Attach the pages to the master
            walkthrough.delegate = self
            walkthrough.add(viewController:page_one)
            walkthrough.add(viewController:page_two)
            walkthrough.add(viewController:page_three)
            walkthrough.add(viewController:page_four)
            walkthrough.add(viewController: page_five)
            walkthrough.add(viewController: page_six)
            walkthrough.add(viewController: page_seven)
            
            self.present(walkthrough, animated: true) {
                ()->() in
                self.needWalkthrough = false
            }
            

            
            
            
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        
 
        
 
        
       /* //DELETE IT After Testing is done!
        
        // Get view controllers and build the walkthrough
        let stb = UIStoryboard(name: "Main", bundle: nil)
        walkthrough = stb.instantiateViewController(withIdentifier: "walk") as! BWWalkthroughViewController
        let page_one = stb.instantiateViewController(withIdentifier: "page_1")
        let page_two = stb.instantiateViewController(withIdentifier: "page_2")
        let page_three = stb.instantiateViewController(withIdentifier: "page_3")
        let page_four = stb.instantiateViewController(withIdentifier: "page_4")
        let page_five = stb.instantiateViewController(withIdentifier: "page_5")
        let page_six = stb.instantiateViewController(withIdentifier: "page_6")
        let page_seven = stb.instantiateViewController(withIdentifier: "page_7")
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.add(viewController:page_one)
        walkthrough.add(viewController:page_two)
        walkthrough.add(viewController:page_three)
        walkthrough.add(viewController:page_four)
        walkthrough.add(viewController: page_five)
        walkthrough.add(viewController: page_six)
        walkthrough.add(viewController: page_seven)
        
        self.present(walkthrough, animated: true) {
            ()->() in
            self.needWalkthrough = false
        }

        
    
    
*/
    
    
    
        navigationController!.navigationBar.barTintColor =  UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1.0)
        
     
       
        
        /* if modelName == Devices.IPhone7Plus{
           
            print("I am right")
        
        }
        else {
            print(modelName)
        
        }
        //print(modelName)
        
        */
        
        
        // self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
        //sself.navigationController?.navigationBar.barTintColor=UIColor.blueColor()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
        
          tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didLogOut))
        
        tabBarController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        
      /*  tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Book Map", style: .plain, target: self, action: #selector(booksNearBy))
        
        tabBarController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.white */
        
        //createSearchBar()
        
    }
    
    
    func booksNearBy (){
    
        
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        
        let viewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "mapTime")
        
        self.present(viewController, animated: true, completion: nil)

    
    
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
        
        if shouldShowSearchResults {
        
            return filteredArray.count
        
        
        }
        
        else {
        return genreArray.count
            
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.backgroundColor = UIColor.clear
        
        if shouldShowSearchResults{
        
            cell.textLabel?.text = filteredArray[indexPath.row]
             cell.textLabel?.textColor = .white
            
             cell.textLabel?.font = UIFont(name: "Chalkduster", size: 16)
            
            return cell
        
        
        }
        else{
        
        cell.textLabel?.text = genreArray[indexPath.row]
            
            cell.textLabel?.textColor = .white
            
            
            
            cell.textLabel?.font = UIFont(name: "Chalkduster", size: 16)

            
            
            
            return cell
        
        }

        
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        shouldShowSearchResults = true
        
        searchBar.endEditing(true)
        
        self.tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        
       // let navVC = segue.destinationViewController as! UINavigationController
        
        let viewController = segue.destination as! ResultTableViewController
        
      
        
        
        //let DestViewController: ResultTableViewController = segue.destinationViewController as! ResultTableViewController
        
        
        
        if segue.identifier == "letsGo" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                if shouldShowSearchResults {
                
                    let tappedItem = self.filteredArray[indexPath.row]
                    
                    viewController.someString = tappedItem
                
                }
                else{
                    let tappedItem = self.genreArray[indexPath.row]
                    
                    viewController.someString = tappedItem
                    
                
                
                }
                
                
                
        
                
            }
            
            
            
        }
        
    }
   
    

}




extension GenreTableViewController{
    
    func walkthroughCloseButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func walkthroughPageDidChange(_ pageNumber: Int) {
        if (self.walkthrough.numberOfPages - 1) == pageNumber{
            self.walkthrough.closeButton?.isHidden = false
        }else{
            //self.walkthrough.closeButton?.isHidden = true
        }
    }
    
}


