//
//  APICaller.swift
//  LogMeIn
//
//  Created by Go Christian Goszal on 01/04/23.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    func getUser(completion: @escaping (Result<[userList], Error>) -> Void){
        guard let url = URL(string: "https://reqres.in/api/users?per_page=12") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: {data, _, error in
            guard let data  = data, error == nil else {return}
            do{
                let result = try JSONDecoder().decode(getUserList.self, from: data)
                completion(.success(result.data))
            }catch {
                completion(.failure(error))
            }
        })
        task.resume()
    }
    
    func postLogin(_ loginData: login){
        guard let url = URL(string: "https://reqres.in/api/login") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: {data, _, error in
            guard let data  = data, error == nil else {return}
            do{
                let response = try JSONDecoder().decode(login.self, from: data)
                print("success")
            }catch {
                print(error)
            }
        })
        task.resume()
    }
}
