//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Linconl Rufino on 12/02/25.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate : AnyObject {
    func sendLoginData(user: String, password: String)
}
