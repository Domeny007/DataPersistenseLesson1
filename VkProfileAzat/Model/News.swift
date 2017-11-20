//
//  News.swift
//  VkProfileAzat
//
//  Created by Азат Алекбаев on 20.11.2017.
//  Copyright © 2017 Азат Алекбаев. All rights reserved.
//

import Foundation
import UIKit

class News: NSObject,NSCoding {
    
@objc var newsID = 0
@objc var wallText: String
@objc var likeNumber: String
@objc var commentNumber: String
@objc var repostNumber: String
@objc var wallImage: UIImage
    var dataString: String
    

    init(newsID: Int, wallText:String, likeNumber: String, commentNumber: String, repostNumber: String, wallImage: UIImage,dataString: String) {
    self.newsID = newsID
    self.wallText = wallText
    self.likeNumber = likeNumber
    self.commentNumber = commentNumber
    self.repostNumber = repostNumber
    self.wallImage = wallImage
    self.dataString = dataString
}
    init(wallText:String,likeNumber: String, commentNumber:String,repostNumber: String, dataString: String,wallImage: UIImage) {
        self.commentNumber = commentNumber
        self.likeNumber = likeNumber
        self.wallText = wallText
        self.repostNumber = repostNumber
        self.wallImage = wallImage
        self.dataString = dataString
    }
func encode(with aCoder: NSCoder) {
    aCoder.encode(newsID, forKey: #keyPath(News.newsID))
    aCoder.encode(wallText, forKey: #keyPath(News.wallText))
    aCoder.encode(likeNumber, forKey: #keyPath(News.likeNumber))
    aCoder.encode(commentNumber, forKey: #keyPath(News.commentNumber))
    aCoder.encode(repostNumber, forKey: #keyPath(News.repostNumber))
    aCoder.encode(wallImage, forKey: #keyPath(News.wallImage))
}

required convenience init?(coder aDecoder: NSCoder) {
    let newsID = aDecoder.decodeInteger(forKey: #keyPath (News.newsID))
    guard let wallText = aDecoder.decodeObject(forKey: #keyPath(News.wallText)) as? String? else {return nil}
    guard let likeNumber = aDecoder.decodeObject(forKey: #keyPath(News.likeNumber)) as? String? else {return nil}
    guard let commentNumer = aDecoder.decodeObject(forKey: #keyPath(News.commentNumber))as? String? else {return nil}
    guard let repostNumber = aDecoder.decodeObject(forKey: #keyPath(News.repostNumber))as? String? else {return nil}
    let wallImage = aDecoder.decodeObject(forKey: #keyPath(News.wallImage)) as! UIImage
    self.init(newsID: newsID, wallText: wallText! , likeNumber: likeNumber! , commentNumber: commentNumer! ,repostNumber: repostNumber!, wallImage: wallImage,dataString: "")
}
 public static func archive(with news: News) -> Data  {
    let archivedData = NSKeyedArchiver.archivedData(withRootObject: news)
    
    return archivedData
}
 public static func unarchive(with data: Data) -> [News] {
    guard let unarchivedNews = NSKeyedUnarchiver.unarchiveObject(with: data) as? [News] else {return []}
    return unarchivedNews
}
}

