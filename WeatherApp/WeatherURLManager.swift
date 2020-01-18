//
//  WeatherURLManager.swift
//  WeatherApp
//
//  Created by MacStudent on 2020-01-17.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class WeatherURLManager {
    static func getCityWeatherURL(city: String) -> URL? {
        let city = city.replacingOccurrences(of: " ", with: "%20")
         let urlString =  "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=67fe70c6947b77644c5ad027c2fdd3ed"

        return URL(string: urlString)
    }
    
    static func getWeatherIconURL(iconCode: String) -> URL? {
        let urlString = "http://openweathermap.org/img/w/\(iconCode).png"
        return URL(string: urlString)
    }
    
    static func getForecastWeatherURL(city: String) -> URL? {
        let city = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=5822f53158fdf0f22ed4fad25842783b"
        return URL(string: urlString)
    }
}


 
