//
//  HolidayModel.swift
//  schoolITimeTable
//
//  Created by student on 2023/06/28.
//

import Foundation

struct HolidayModel: Codable {
    
    var date: String
    
    var week: String
    
    var weekEn: String
    
    var name: String
    
    var nameEn: String
    
    enum CodingKeys: String, CodingKey {
        case date
        case week
        case weekEn = "week_en"
        case name
        case nameEn = "name_en"
    }
}
