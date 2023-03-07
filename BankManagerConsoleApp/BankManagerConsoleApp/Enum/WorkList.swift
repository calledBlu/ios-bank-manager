//
//  WorkList.swift
//  BankManagerConsoleApp
//
//  Created by 이상윤 on 2023/03/07.
//

import Foundation

enum WorkList: String, CaseIterable {

    case account = "예금"
    case loan = "대출"

    static func setRandomWork() -> String {
        let works = WorkList.allCases
        guard let pickRandomWork = works.randomElement() else { return "" }

        return pickRandomWork.rawValue
    }
}
