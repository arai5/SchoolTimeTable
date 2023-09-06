//
//  LissonListViewModel.swift
//  schoolITimeTable
//
//  Created by student on 2023/05/10.
//

import Foundation

struct LessonListViewModel {
    
    enum DayOfWeek: Int, CaseIterable {
        case monday
        case thuesday
        case wednesday
        case thursday
        case friday
        
        func fetchLabel() -> String{
            switch self {
            case .monday:
                return "月曜日"
            case .thuesday:
                return "火曜日"
            case .wednesday:
                return "水曜日"
            case .thursday:
                return "木曜日"
            case .friday:
                return "金曜日"
            }
        }
    }
    
    var monday:[LessonDetailViewModel]
    
    var thuesday:[LessonDetailViewModel]
    
    var wednesday:[LessonDetailViewModel]
    
    var thursday:[LessonDetailViewModel]
    
    var friday:[LessonDetailViewModel]
    
    init(monday:[LessonDetailViewModel], thuesday:[LessonDetailViewModel], wednesday:[LessonDetailViewModel], thursday:[LessonDetailViewModel], friday:[LessonDetailViewModel]) {
        self.monday = monday
        self.thuesday = thuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
    }
    
    init(dataObject: LessonListDataObject) {
        self.monday = dataObject.monday.compactMap { detailItem in
            return LessonDetailViewModel(dataObject: detailItem)
        }
        self.thuesday = dataObject.thuesday.compactMap { detailItem in
            return LessonDetailViewModel(dataObject: detailItem)
        }
        self.wednesday = dataObject.wednesday.compactMap { datailItem in
            return LessonDetailViewModel(dataObject: datailItem)
        }
        self.thursday = dataObject.thursday.compactMap { datailItem in
            return LessonDetailViewModel(dataObject: datailItem)
        }
        self.friday = dataObject.friday.compactMap { datailItem in
            return LessonDetailViewModel(dataObject: datailItem)
        }
    }
    
    func fetch(item: DayOfWeek) -> [LessonDetailViewModel] {
        switch item{
        case .monday:
            return monday
        case .thuesday:
            return thuesday
        case .wednesday:
            return wednesday
        case .thursday:
            return thursday
        case .friday:
            return friday
        }
    }
    
    func add(item:  LessonDetailViewModel, dayOfWeek: DayOfWeek) -> LessonListViewModel {
        var monday: [LessonDetailViewModel] = self.monday
        var thuesday: [LessonDetailViewModel] = self.thuesday
        var wednesday: [LessonDetailViewModel] = self.wednesday
        var thursday: [LessonDetailViewModel] = self.thursday
        var friday: [LessonDetailViewModel] = self.friday
        
        switch dayOfWeek {
        case .monday:
            monday.append(item)
        case .thuesday:
            thuesday.append(item)
        case .wednesday:
            wednesday.append(item)
        case .thursday:
            thursday.append(item)
        case .friday:
            friday.append(item)
        }
        
        return .init(
            monday: monday,
            thuesday: thuesday,
            wednesday: wednesday,
            thursday: thursday,
            friday: friday)
    }
    
    func remove(item: LessonDetailViewModel) -> LessonListViewModel {
        let removeItemId = item.lessonId
        let monday: [LessonDetailViewModel] = remove(id: removeItemId, items: self.monday)
        let thuesday: [LessonDetailViewModel] = remove(id: removeItemId, items: self.thuesday)
        let wednesday: [LessonDetailViewModel] = remove(id: removeItemId, items: self.monday)
        let thursday: [LessonDetailViewModel] = remove(id: removeItemId, items: self.thursday)
        let friday: [LessonDetailViewModel] = remove(id: removeItemId, items: self.friday)
        return LessonListViewModel(
        monday: monday,
        thuesday: thuesday,
        wednesday: wednesday,
        thursday: thursday,
        friday: friday)
        
    }
    
    func remove(id: String, items: [LessonDetailViewModel]) -> [LessonDetailViewModel] {
        return items.filter({ item in
            return item.lessonId != id
        })
    }
    
}
