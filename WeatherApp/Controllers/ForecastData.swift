//
//  ForecastData.swift
//  WeatherApp
//
//  Created by MacStudent on 2020-01-17.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
var cities: [String]?
class ForecastData{
    internal init(city: String, data: JSON) {
        self.dateString = ""
        self.cityName = city
        self.dayTemp="\(data["main"]["temp"].intValue)"
        self.highTemp = "\(data["main"]["temp_max"].intValue)"
        self.lowTemp = "\(data["main"]["temp_min"].intValue)"
        self.feelTemp = "\(data["main"]["feels_like"].intValue)"
        let date=Date(timeIntervalSince1970: data["dt"].doubleValue)
        let dateFormatter=DateFormatter()
       dateFormatter.dateFormat = "EEE,MM,dd"
        let hourFormatter=DateFormatter()
       hourFormatter.dateFormat = "h:mm a"
        self.dateString = dateFormatter.string(from: date)
         self.hour = hourFormatter.string(from: date)
      
        self.iconCode =  "\(data["weather"].arrayValue[0]["icon"].intValue)"
    }
    
    var dateString:String
    var cityName:String
    var dayTemp:String
    var highTemp:String
    var lowTemp:String
    var feelTemp:String
    var hour:String
    var iconCode:String
    
    
}
