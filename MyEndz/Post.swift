//
//  Post.swift
//  MyEndz
//
//  Created by Dinesh Vijaykumar on 30/10/2016.
//  Copyright © 2016 Dinesh Vijaykumar. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDescription: String!
    
    var imagePath: String {
        return _imagePath
    }
    
    var title: String {
        return _title
    }
    
    var postDescription: String {
        return _postDescription
    }
    
    init(imagePath:String, title:String, description:String) {
        self._imagePath = imagePath
        self._title = title
        self._postDescription = description
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = (aDecoder.decodeObject(forKey: "imagePath") as? String)
        self._title = aDecoder.decodeObject(forKey: "title") as? String
        self._postDescription = aDecoder.decodeObject(forKey: "description") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._imagePath, forKey: "imagePath")
        aCoder.encode(self._title, forKey: "title")
        aCoder.encode(self._postDescription, forKey: "description")
    }
}
