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
    
    static func getUniqueIdentifier() -> Int {
    
    init(indentifier: Int){
        self.indentifier = 0
    }
}
