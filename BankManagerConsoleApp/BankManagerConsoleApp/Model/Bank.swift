//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/27.
//

import Foundation

struct Bank: CustomerManageable {

    let accountBanker = Banker(processingTime: 0.7)
    let loanBanker = Banker(processingTime: 1.1)

    func open() {
        
        let numberOfTodayCustomers = makeAcceptableNumber()
        let customerQueue = makeCustomerQueue(maxCount: numberOfTodayCustomers)
        let loanSemaphore = DispatchSemaphore(value: 1)
        let accountSemaphore = DispatchSemaphore(value: 2)
        let group = DispatchGroup()
        var numberOfAccountCustomers = 0
        var numberOfloanCustomers = 0

        while !customerQueue.isEmpty() {
            guard let currentCustomer = customerQueue.dequeue() else { return }

            let currentCustomerWorkType = currentCustomer.workType

            if currentCustomerWorkType == WorkList.account.rawValue {
                DispatchQueue.global().async(group: group) {
                    accountSemaphore.wait()
                    accountBanker.work(for: currentCustomer.waitingOrder, what: currentCustomerWorkType)
                    numberOfAccountCustomers += 1
                    accountSemaphore.signal()
                }
            } else {
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    loanBanker.work(for: currentCustomer.waitingOrder, what: currentCustomerWorkType)
                    numberOfloanCustomers += 1
                    loanSemaphore.signal()
                }
            }
        }

        group.wait()

        let totalWorkTime = calculateTotalWorkTime(customers: numberOfAccountCustomers, numberOfloanCustomers, processingTimes: accountBanker.processingTime, loanBanker.processingTime)

        showWorkFinishMessage(numberOfTodayCustomers, totalWorkTime)
    }

    func showWorkFinishMessage(_ totalNumber: Int, _ totalTime: Double) {
        let totalWorkTime = String(format: "%.2f", totalTime)

        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumber)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }

    func calculateTotalWorkTime(customers: Int..., processingTimes: Double...) -> Double {
        var result = 0.0

        customers.enumerated().forEach {
             let tempResult = Double($1) * processingTimes[$0]
            result += tempResult
        }

        return result
    }
}
