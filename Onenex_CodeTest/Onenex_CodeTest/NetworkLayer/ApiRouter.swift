//
//  ApiRouter.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation
import Alamofire


enum ApiRouter: URLConvertible {
    
    case fetchArticleLists
    
    func asURL() throws -> URL {
        let urlString = baseURL + api + path
        let url = URL(string: urlString)!
        return url
    }
    
    var baseURL: String {
        return "https://codetest.onenex.pro/"
    }
    
    var api: String {
        return "api/"
    }
    
    var path: String {
        switch self {
        case .fetchArticleLists:
            return "articles"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchArticleLists:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchArticleLists:
            return HTTPHeaders.init([
                HTTPHeader(name: "Authorization", value: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTRiYjkwZC1lYjRhLTRmOTMtYmNhMS0wZDcyZjllM2FiZTMiLCJqdGkiOiI3OGVhMDViYjI1MjAzYzU1MmY2M2QxZWU3MzkyOTJkYTc4NTAwZjRmZDhmNTI2OTY5ZjdlMGI0YjgwMTM3NGE3NmViZWU2N2QxNWI4Njk4MyIsImlhdCI6MTY4NTY5Njk3MC40NDY0NzUsIm5iZiI6MTY4NTY5Njk3MC40NDY0NzcsImV4cCI6MTcxNzMxOTM3MC40NDI2Nywic3ViIjoiMjU4MDUxNTg0Nzc2OTYwIiwic2NvcGVzIjpbXX0.GqMh_Al2nT6pqegDR4LNaS6q5zbkD9RXcdQfzx3_APAG1l8WHtzqcL1L7esqZbsHJOYDyQTjp-noqbsTakz2cigUuL5QohxMxt0bQVb5JyluvW5LJDf6tMFXxL5pDPeKK0p96qmLxS3lk4HQdyI2ZVQBGDd0wKmC5i7ZMdTRGJDEhehGZOsXMv8kj6Z2qJfFPlAh9rVIhW5AsfaQQtgydb-UF-Wox3w2OdxeiAhOTwewA-04h0hje9dgz_n0b1rEG9DC6B4bXF0BhnaTeSjG-9Oua8ztNH2PLUmQga2yZOkaQJKg-wYJt4Iq39RDHjBWaYwJRO88w88nmNGMrkrIIqX1VBG56UuQvEyI2NYsO60NCWCOJB_UjBWAzuwK6kK24YheeswL6i1DrH_vDVfVuZbbtJr5Dg3sgdz12wjrfJjY4qd_2XxpRRm29PyAfS4OvecJuP7Sut0kYdtoCI_ECT4A3vn-A3ln1XzzGPdDd7_-8yctt7VHfL-6JvuiMIToL-QY393Wn7qvpdJHn0xlUxOBEo2Hh2ZBWy6JiqmQ0_zX7JXNedhseY4QGiM_opfrcKHU2kUgqLoI3nv8Ny8gwGws2sHJ4krXJXF8Gs8isTIdfq8ctQZ1BwPzqzBvXP7kPM1g-8fdANmwTvbSwOaa9FesQS9_2-E6KSg_8ht8MRk")
            ])
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchArticleLists:
            return URLEncoding.default
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchArticleLists:
            return .get
        }
    }
    
    
}
