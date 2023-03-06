//
//  Counter.swift
//  BankManagerConsoleApp
//
//  Created by 이상윤 on 2023/03/04.
//

import Foundation

class Counter {
    private var numberOfAccountCustomers = 0
    private var numberOfloanCustomers = 0

    func addAccountCustomer(with AccountCustomers: Int) {
        numberOfAccountCustomers += AccountCustomers
    }

    func addLoanCustomer(with LoanCustomers: Int) {
        numberOfloanCustomers += LoanCustomers
    }

    func getAccountCustomerCount() -> Int {
        return numberOfAccountCustomers
    }

    func getLoanCustomerCount() -> Int {
        return numberOfloanCustomers
    }

    func resetCounter() {
        numberOfAccountCustomers = 0
        numberOfloanCustomers = 0
    }
}
