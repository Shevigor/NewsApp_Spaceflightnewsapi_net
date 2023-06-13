//
//  ApiCall.swift
//  NewsApp_Spaceflightnewsapi_net
//
//  Created by user on 07.06.2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var news:[NewsApi] = []
    @Published var url = "https://api.spaceflightnewsapi.net/v3/articles/"
    
    func fetchData() {
        guard let url = URL(string: url) else {return}
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {return}
           
            print("JSON:")
            print(String(data: data, encoding: .utf8) ?? "-")
            
            do {
//++ 1 variant
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
//                let news = try decoder.decode([NewsApi].self, from: data)
//-- 1 variant
                
                
//++ 2 variant
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(formatter)
                let news = try decoder.decode([NewsApi].self, from: data)
//-- 2 variant
                
                print("---\ndecoded data in JSON:")
                for _new in news {
                    print(_new.url)
                }
                
                
                DispatchQueue.main.async {
                    self?.news = news
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

extension DateFormatter {
  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
//          "publishedAt": "2023-06-09T04:17:42.000Z",
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
