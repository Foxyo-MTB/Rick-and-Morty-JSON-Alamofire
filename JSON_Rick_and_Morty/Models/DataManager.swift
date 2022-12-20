//
//  DataManager.swift
//  JSON_Rick_and_Morty
//
//  Created by Vladimir Beliakov on 19.09.2022.
//

import Foundation
import Alamofire

class DataManager {
    
    static let shared = DataManager()
    
    var post: PostRequestModel?
    var character: DataModel?
    
    //let rickURL = "https://rickandmortyapi.com/api/character"
    
    func fetchRick(page: Int, handler: @escaping ((DataModel) -> Void)) {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character?page=\(page)") else { return }
        
        AF.request(url).validate().responseDecodable(of: DataModel.self) { response in
            self.character = response.value
            handler(self.character!)
        }
    }
    
    func postRequestWithAlamofire(handler: @escaping ((PostRequestModel) -> Void)) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let userData = [
            "info": "Post request done well"
        ]
        
        AF.request(url, method: .post, parameters: userData).validate().responseDecodable(of: PostRequestModel.self) { responseData in
            self.post = responseData.value
            handler(self.post!)
        }
    }
}
