//
//  Card.swift
//  Concentration
//
//  Created by 龚晨杰 on 2019/6/22.
//  Copyright © 2019 龚晨杰. All rights reserved.
//

import Foundation


struct Card
{
    // MARK: bookmark
    
    var isFaceUp = false
    var isMatched = false
    var indentifier: Int
    
    static var totalAmtIdent = 0
    static func getUniqueIdentifier() -> Int {
        totalAmtIdent += 1
        return totalAmtIdent
    }
    init(){
        self.indentifier = Card.getUniqueIdentifier()
    }
}
