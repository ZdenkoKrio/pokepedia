//
//  StringExtension.swift
//  Pokepedia
//
//  Created by Zdenko Čepan on 09.09.2023.
//

import Foundation

extension String {
    var isNumber: Bool {
        return self.allSatisfy { character in
            character.isWholeNumber

        }
    }
}
