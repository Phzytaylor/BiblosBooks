//
//  bookAnnotation.swift
//  biblos
//
//  Created by Taylor FIckle Simpson on 2/16/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//
import Foundation
import UIKit
import MapKit

class BookAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D


    var title: String?
    var Author:String?
    var Genre: String?
    var Comment: String?
    var User: String?
    var bookPhoto: String?
    var userID: String?
    var userPhoto: String?
    var userLocation: String?
    var bookRating: String?
    var pushingID: String?
    var bookLat: Double?
    var bookLng: Double?
    


    init(title: String, Author: String, Genre: String, Comment: String, User: String, bookPhoto: String, userID: String, userPhoto: String, userLocation: String, bookRating: String, pushingID: String, coordinate: CLLocationCoordinate2D){
    
       self.title = title
        self.Author = Author
        self.Genre = Genre
        self.Comment = Comment
        self.User = User
        self.bookPhoto = bookPhoto
        self.userID = userID
        self.userPhoto = userPhoto
        self.userLocation = userLocation
        self.bookRating = bookRating
        self.pushingID = pushingID
        
        self.coordinate = coordinate
        
        super.init()
    }

    var subtitle: String? {
        return Author
    
    }


}
