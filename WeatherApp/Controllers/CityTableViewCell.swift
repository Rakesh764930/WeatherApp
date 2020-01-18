//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by MacStudent on 2020-01-17.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var cityIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCity(city: String) {
            lblCity.text = city
            if let weatherUrl = WeatherURLManager.getCityWeatherURL(city: city) {
                // create a session
                let session = URLSession.shared
                // create a task
                let task = session.dataTask(with: weatherUrl) { (data, response, error) in
                    if data != nil {
                        // load the temp
                        if let weatherData = try? JSON(data: data!) {
                            print(weatherData)
                            let tempValue = weatherData["main"]["temp"].intValue
                            self.loadIcon(weatherData: weatherData)
                            // UI is in main thread
                            DispatchQueue.main.async {
                                self.lblTemp.text = "\(tempValue)"
                            }
                        }
                    }
                }
                // start the task
                task.resume()
            }
        }
        
        func loadIcon(weatherData: JSON) {
            let weatherArray = weatherData["weather"].arrayValue
            let iconCode = weatherArray[0]["icon"].stringValue
            if let iconUrl = WeatherURLManager.getWeatherIconURL(iconCode: iconCode) {
                let session = URLSession.shared
                let task = session.dataTask(with: iconUrl) { (data, response, error) in
                    if let iconData = data {
                        // update the UI
                        DispatchQueue.main.async {
                            self.cityIcon.image = UIImage(data: iconData)
                        }
                    }
                }; task.resume()
            }
           
        }
    

    }
