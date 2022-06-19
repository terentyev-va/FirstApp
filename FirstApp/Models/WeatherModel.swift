//
//  WeatherModel.swift
//  FirstApp
//
//  Created by Вячеслав Терентьев on 19.06.2022.
//

import Foundation

struct WeatherModel: Decodable {
    
    let name: String
    let main: Main
    let weather: [WeatherElement]
    
}

struct Main: Decodable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
          case temp
          case tempMin = "temp_min"
          case tempMax = "temp_max"
      }
    
    var temperatureCelsius: Int {
        Int(temp)
    }
}

struct WeatherElement: Decodable {

    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
    
    var myDescription: String {
        switch weatherDescription {
        case "clear sky": return "Ясно"
        case "few clouds": return "Облачно"
        case "scattered clouds": return "Облачно"
        case "broken clouds": return "Облачно"
        case "shower rain": return "Сильный дождь"
        case "rain": return "Дождь"
        case "thunderstorm": return "Гроза"
        case "snow": return "Снег"
        case "mist": return "Туман"
        default: return "No data"
        }
    }
}
