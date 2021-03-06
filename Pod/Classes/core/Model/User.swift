//
//  ShiftUser.swift
//  AptoSDK
//
//  Created by Ivan Oliver Martínez on 12/10/2016.
//
//

import Foundation
import Bond

@objc open class ShiftUser: NSObject {
  public let userId: String
  open var userData = DataPointList()
  open var accessToken: AccessToken?

  public init(userId: String, accessToken: AccessToken?) {
    self.userId = userId
    self.accessToken = accessToken
  }

  open func clearUserData() {
    self.userData = DataPointList()
  }
}

extension ShiftUser {
  public func cardList() -> [Card] {
    var retVal = [Card]()
    guard let financialAccounts = self.userData.getDataPointsOf(type: .financialAccount) as? [FinancialAccount] else {
      return retVal
    }
    for financialAccount in financialAccounts where financialAccount.accountType == .card {
      if let card = financialAccount as? Card {
        retVal.append(card)
      }
    }
    return retVal
  }
}
