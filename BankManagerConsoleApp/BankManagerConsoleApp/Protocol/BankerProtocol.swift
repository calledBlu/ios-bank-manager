//
//  BankerProtocol.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/22.
//

import Foundation

protocol BankerProtocol {

    func work(for currentCustomerNumber: Int, what workType: String)
    func workStart(_ orderNumber: Int, what workType: String) -> String
    func workComplete(_ orderNumber: Int, what workType: String) -> String
}

extension BankerProtocol {

    func workStart(_ orderNumber: Int, what workType: String) -> String { "\(orderNumber)번 고객 \(workType)업무 시작" }

    func workComplete(_ orderNumber: Int, what workType: String) -> String { "\(orderNumber)번 고객 \(workType)업무 완료" }
}

