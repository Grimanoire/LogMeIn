//
//  UserList.swift
//  LogMeIn
//
//  Created by Go Christian Goszal on 01/04/23.
//

import Foundation

struct getUserList: Codable {
    let data: [userList]
}

struct userList: Codable {
    let id: Int
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
}
