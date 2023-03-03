//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/22.
//

import Foundation

struct Banker: BankerProtocol {

    var processingTime: Double

    func work(for currentCustomerNumber: Int, what workType: String) {
        print(workStart(currentCustomerNumber, what: workType))
        Thread.sleep(forTimeInterval: processingTime)
        print(workComplete(currentCustomerNumber, what: workType))
    }
}
