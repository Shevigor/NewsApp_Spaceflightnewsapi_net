//
//  ContentView.swift
//  NewsApp_Spaceflightnewsapi_net
//
//  Created by user on 07.06.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach (vm.news, id: \.id){ news in
                    VStack (alignment: .leading) {
                        AsyncImage(url: URL(string: news.urlImage)) { Image in
                            Image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 350)
                            
                        } placeholder: {
                            ProgressView()
                        }
                        VStack (alignment: .leading, spacing: 5) {
                            //Image(news.newsSite)
                            Text(news.title)
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(news.summary)
                                .font(.callout)
                                .fontWeight(.bold)
//                            Text(news.publishedAt.formatted(.dateTime .month() .day() .year() .hour() .minute()))
                            Text(news.datePublished.formatted(date: .long, time: .shortened))
                            Link(destination: URL(string: news.url)!, label: {
                                Text("")
                            })
                        }
                    }
                }
            }
            .navigationTitle("News")
            .foregroundColor(.blue)
            .task {
                vm.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
