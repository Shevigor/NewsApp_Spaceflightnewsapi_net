//
//  DataModel.swift
//  NewsApp_Spaceflightnewsapi_net
//
//  Created by user on 07.06.2023.
//

import Foundation
struct NewsApi: Decodable {
    let id: Int
    let title: String
    let url: String
    let urlImage: String
    let summary: String
    let newsSite: String
    let datePublished : Date
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case title = "title"
        case url = "url"
        case urlImage = "imageUrl"                  //
        case summary = "summary"
        case newsSite = "newsSite"
        case datePublished = "publishedAt"          //
    }
}

/*
{
  "id": 19601,
  "title": "Video shows Astroscale’s plan to deorbit multiple satellites",
  "url": "https://spacenews.com/astroscale-video-shows-plan-to-deorbit-multiple-satellites/",
  "imageUrl": "https://i0.wp.com/spacenews.com/wp-content/uploads/2023/06/rsz_screenshot_2023-06-08_at_92107_pm.png",
  "newsSite": "SpaceNews",
  "summary": "In 2025, Astroscale plans to send ELSA-M into very low Earth orbit for commissioning.",
  "publishedAt": "2023-06-09T04:17:42.000Z",
  "updatedAt": "2023-06-09T04:36:57.692Z",
  "featured": false,
  "launches": [],
  "events": []
},
*/
