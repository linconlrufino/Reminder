//
//  String+Ext.swift
//  Reminder
//
//  Created by Linconl Rufino on 09/02/25.
//

import Foundation

extension String {
    var localize: String {
        return NSLocalizedString(self, comment: "")
    }
}
