//
//  WorkList.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/03/02.
//

import Foundation

enum WorkList: String, CaseIterable {

    case account = "예금"
    case loan = "대출"

    static func returnRandomWork() -> String {
        let works = WorkList.allCases
        guard let pickRandomWork = works.randomElement() else { return "" }

        return pickRandomWork.rawValue
    }
}
