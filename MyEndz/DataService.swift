//
//  DataService.swift
//  MyEndz
//
//  Created by Dinesh Vijaykumar on 05/11/2016.
//  Copyright © 2016 Dinesh Vijaykumar. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    let KEY_POSTS = "posts"
    private var _loadedPosts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
        UserDefaults.standard.set(postsData, forKey: KEY_POSTS)
        UserDefaults.standard.synchronize()
    }
    
    func loadPosts() {
        if let postsData = UserDefaults.standard.object(forKey: KEY_POSTS) as? Data {
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post] {
                _loadedPosts = postsArray
            }
        }
        
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
    }
    
    func saveImageAndCreatePath(image:UIImage) -> String {
        let imageData = UIImagePNGRepresentation(image)
        let imagePath = "image\(Date.timeIntervalSinceReferenceDate).png"
        let fullPath = documentsPathForFileName(name: imagePath)
        do {
             try imageData?.write(to: URL(fileURLWithPath: fullPath))
        } catch {
            print(error)
        }
       
        return imagePath
    }
    
    func imageForPath(path:String) -> UIImage? {
        let fullPath = documentsPathForFileName(name: path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post:Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name:String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
}
