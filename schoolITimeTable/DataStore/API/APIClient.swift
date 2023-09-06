//
//  APIClient.swift
//  schoolITimeTable
//
//  Created by student on 2023/06/26.
//

import Foundation
import Network

class APIClient {
    
    func fetchHoliday(completion: @escaping (Result<HolidaysModel, Error>) -> Void) {
        guard let url = URL(string: "https://holidays-jp.github.io/api/v1/date.json.schoolTimeTable/") else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let holidaysModel = try JSONDecoder().decode(HolidaysModel.self, from: data)
                completion(.success(holidaysModel))
            } catch {
                completion(.failure(error))
            }
        //data 処理
        print("取得完了")
   }
        print("取得開始")
        task.resume()
}
}
