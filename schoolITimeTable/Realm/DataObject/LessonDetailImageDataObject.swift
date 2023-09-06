//
//  LessonDetailImageDataObject.swift
//  schoolITimeTable
//
//  Created by student on 2023/05/29.
//
import RealmSwift
import UIKit

class LessonDetailImageDataObject: Object {
    
    @Persisted var image: Data
    
    override init() {}
    
    init(image: UIImage) {
        self.image = image.jpegData(compressionQuality: 0.0)!
    }
}

