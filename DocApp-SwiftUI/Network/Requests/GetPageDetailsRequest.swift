//
//  GetPageDetailsRequest.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 13.4.25.
//

import Foundation
import Alamofire
import Combine

struct GetPageDetailsRequest: APIRequest {
    typealias Response = Page

    var method: HTTPMethod = .get
    var path: String = "/6c823976-465e-401e-ae8d-d657d278e98e"
}
