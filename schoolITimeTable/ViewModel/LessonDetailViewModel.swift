//
//  LessonDetalViewModel.swift
//  schoolITimeTable
//
//  Created by student on 2023/04/26.
//

import Foundation
import UIKit

struct LessonDetailViewModel{
    var lessonId: String = UUID() .uuidString
    
    var title: String
    
    var teacher: String
    
    var images: [UIImage]
    
    var summary: String
    
    init(title: String, teacher: String, images: [UIImage], summary: String) {
        self.title = title
        self.teacher = teacher
        self.images = images
        self.summary = summary
    }
    
    init(dataObject: LessonDetailDataObjcet) {
        self.lessonId = dataObject.lessonId
        self.title = dataObject.title
        self.teacher = dataObject.teacher
        var images: [UIImage] = []
        for imageDataObject in dataObject.images {
            guard let image = UIImage(data: imageDataObject.image) else {
                continue
            }
            images.append(image)
        }
        self.images = images
        self.summary = dataObject.summary
    }
}
