//
//  Concentration.swift
//  Concentration
//
//  Created by 龚晨杰 on 2019/6/22.
//  Copyright © 2019 龚晨杰. All rights reserved.
//

import Foundation

class Concentration
{
//    var card = Array<Card>()
    var cards_array = [Card]()
    
  
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards{
            let card_obj = Card()
            // add card and match_card
            cards_array += [card_obj,card_obj]
        }

        
        print("\(numberOfPairsOfCards) pairs of the card has been created")

        // TODO: Shuffle the cards
    }
}
