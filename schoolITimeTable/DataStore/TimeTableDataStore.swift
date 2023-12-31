//
//  TimeTableDatastore.swift
//  schoolITimeTable
//
//  Created by student on 2023/05/24.
//
import RealmSwift
import Foundation

class TimeTableDataStore {
    
    static let shared: TimeTableDataStore = .init()
    
    let realmClient: RealmClient = RealmClient()
    
    var listViewModel: LessonListViewModel {
        guard let dataObject = realmClient .fetchListData() else {
            return .init(monday: [], thuesday: [], wednesday: [], thursday: [], friday: [])
        }
        return .init(dataObject: dataObject)
    }
    
    func add(item: LessonDetailViewModel, dayOfWeek: LessonListViewModel.DayOfWeek) {
        let latestListViewModel = listViewModel.add(item: item, dayOfWeek: dayOfWeek)
        let dataObject = LessonListDataObject(listViewModel: latestListViewModel)
        realmClient.saveListData(dataObject: dataObject)
    }
    
    func remove(item: LessonDetailViewModel) {
        let latestListViewModel = listViewModel.remove(item: item)
        let dataObject = LessonListDataObject(listViewModel: latestListViewModel)
        realmClient.saveListData(dataObject: dataObject)
    }
    
}
