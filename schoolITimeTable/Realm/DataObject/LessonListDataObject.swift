//
//  LessonListDataObject.swift
//  schoolITimeTable
//
//  Created by student on 2023/05/29.
//
import RealmSwift
import Foundation

class LessonListDataObject: Object {
    @Persisted var monday: List<LessonDetailDataObjcet>
    
    @Persisted var thuesday: List<LessonDetailDataObjcet>
    
    @Persisted var wednesday: List<LessonDetailDataObjcet>
    
    @Persisted var thursday: List<LessonDetailDataObjcet>

    @Persisted var friday: List<LessonDetailDataObjcet>
    
    override init() {}
    
    init(listViewModel: LessonListViewModel) {
        super.init()
        self.monday = translate(viewModels: listViewModel.monday)
        self.thuesday = translate(viewModels: listViewModel.thuesday)
        self.wednesday = translate(viewModels: listViewModel.wednesday)
        self.thursday = translate(viewModels: listViewModel.thursday)
        self.friday = translate(viewModels: listViewModel.friday)
}
    
    func translate(viewModels: [LessonDetailViewModel]) -> List<LessonDetailDataObjcet> {
        let list = List<LessonDetailDataObjcet>()
        for item in viewModels {
            let object = LessonDetailDataObjcet(viewModel: item)
            list.append(object)
    }
    return list
}
}
