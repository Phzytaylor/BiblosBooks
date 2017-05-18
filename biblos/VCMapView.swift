//
//  VCMapView.swift
//  biblos
//
//  Created by Taylor FIckle Simpson on 2/17/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import Foundation
import MapKit

extension booksNearByViewController: MKMapViewDelegate {
    
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? BookAnnotation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type:.detailDisclosure) as UIView
            }
            return view
        }
        return nil
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("I WIN HAHA")
        
        if let annotation = view.annotation as? BookAnnotation {
        
            bookAuthor = annotation.Author!
            bookGenre = annotation.Genre!
            Comment = annotation.Comment!
            
            print ("This is the comment: \(Comment)")
            bookUser = annotation.User!
            bookPhoto = annotation.bookPhoto!
            userID = annotation.userID!
            userPhoto = annotation.userPhoto!
            userLocation = annotation.userLocation!
            bookRating = annotation.bookRating!
            bookPushingID = annotation.pushingID!
            
        
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        
        
        
        if (segue.identifier == "mapToInfo") {
            
            
            //let navVC = segue.destinationViewController as! UINavigationController
            
            
        // This constant below was from before the major UI update
            
           // let viewController = segue.destination as! MoreInfoViewController
            
            
            
            let viewController = segue.destination as! NewMoreInformationViewController
          
            
            
            
                
            
                
                // your new view controller should have property that will store passed value
                viewController.bookComment = Comment
            
            
                viewController.UserToBeContacted = bookUser
                viewController.UserContactedID = userID
                viewController.userPictureurl = userPhoto
                viewController.userLocate = userLocation
                viewController.bookPictureLink = bookPhoto
                viewController.genreOfBook = bookGenre
                viewController.titleOfBook = bookTitle
                viewController.userBeingPushedMSG = bookPushingID
                viewController.bookComment = Comment
                
            
                
                //print("THIS IS THE USER TO BE PUSHED \(bookPushingID)")
                
                
                
            
            
            
            
            
            
            
            
            
            
        }
        
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("You Touched ME!")
        
        if let annotation = view.annotation as? BookAnnotation {
            
            bookAuthor = annotation.Author!
            bookGenre = annotation.Genre!
            Comment = annotation.Comment!
            bookUser = annotation.User!
            bookPhoto = annotation.bookPhoto!
            userID = annotation.userID!
            userPhoto = annotation.userPhoto!
            userLocation = annotation.userLocation!
            bookRating = annotation.bookRating!
            bookPushingID = annotation.pushingID!
            bookTitle = annotation.title!
            
            
           
            
            
            
           performSegue(withIdentifier: "mapToInfo", sender: booksNearByViewController.self)
            
            
        }

        

        
        
        
        
    }

    
    func postBooks(){
    
    
        let bookRef = dataBase.reference().child("books")
        
        
        
        
        bookRef.observeSingleEvent(of: .value, with: {snapshot in
            
            
            
            
            
            
            if let userDict = snapshot.value as? [String:AnyObject]{
                
                for each in userDict as [String:AnyObject]{
                    
                    let bookLats = each.value["bookLat"] as! String
                    
                    let userPhoto = each.value["userPhoto"] as! String
                    
                    let bookLngs = each.value["bookLng"] as! String
                    
                    let bookTitle = each.value["title"] as! String
                    
                    let Author = each.value["Author"] as! String
                    let Comment = each.value["Comment"] as! String
                    let Genre = each.value["Genre"] as! String
                    let User = each.value["User"] as! String
                    let bookPhoto = each.value["bookPhoto"] as! String
                    let userID = each.value["userID"] as! String
                    let userLocation = each.value["userLocation"] as! String
                    let bookRate = each.value["bookRating"] as! String
                    let userToBePushed = each.value["pushingID"] as! String
                    
                    
                    
                    
                    self.bookLatArrayDouble.append((bookLats as NSString).doubleValue)
                    
                    self.bookLngArrayDouble.append((bookLngs as NSString).doubleValue)
                    
                    self.bookTitlesArray.append(bookTitle)
                    
                    self.commentsArry.append(Comment)
                    
                    self.AuthorArray.append(Author)
                    
                    self.CommentArray.append(Author)
                    
                    self.GenreArray.append(Genre)
                    
                    self.UserArray.append(User)
                    
                    self.bookPhotoArray.append(bookPhoto)
                    
                    self.userIDArray.append(userID)
                    
                    self.userLocationArray.append(userLocation)
                    
                    self.bookRateArray.append(bookRate)
                    
                    self.userToBePushedArray.append(userToBePushed)
                    
                    self.userPhotoArray.append(userPhoto)
                    
                    
                    
                    
                    
                    
                    // self.bookCordArray.append([(bookLats as NSString).doubleValue] + [(bookLngs as NSString).doubleValue])
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
                
            }
            
            
            
            for i in 0...(self.bookLatArrayDouble.count-1){
                
                let locationCoordinates = CLLocationCoordinate2D(latitude: self.bookLatArrayDouble[i], longitude: self.bookLngArrayDouble[i])
                
                
                // let point = BookAnnotation(title:self.bookTitlesArray[i], Comment: self.commentsArry[i],coordinate: locationCoordinates)
                
                let point = BookAnnotation(title: self.bookTitlesArray[i], Author: self.AuthorArray[i], Genre: self.GenreArray[i], Comment: self.commentsArry[i], User: self.UserArray[i], bookPhoto: self.bookPhotoArray[i], userID: self.userIDArray[i], userPhoto: self.userPhotoArray[i], userLocation: self.userLocationArray[i], bookRating: self.bookRateArray[i], pushingID: self.userToBePushedArray[i], coordinate: locationCoordinates)
                
                //point.title = self.bookTitlesArray[i]
                
                
                
                
                
                self.Map.addAnnotation(point)
                
                
                
                
                
                
                //self.bookAnts.append(point)
                
                
                /*  let pointAnnotation = MKPointAnnotation()
                 
                 
                 
                 
                 
                 
                 pointAnnotation.title = self.bookTitlesArray[i]
                 
                 
                 
                 
                 pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: self.bookLatArrayDouble[i], longitude: self.bookLngArrayDouble[i])
                 
                 
                 
                 self.bookAnts.append(pointAnnotation)
                 
                 
                 
                 */
                
                
                
                
                
            }
            
            
            
            
            
            
            
            
            
            // self.Map.addAnnotations(self.bookAnts)
            
            
            //var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(38.56853989310081, -121.4339398601701)
            
            
            
            
            
            //let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            
            //self.Map.setRegion(region, animated: true)
            
            
            
            
            
            
            
        })
    
    
    }
    
    


}
