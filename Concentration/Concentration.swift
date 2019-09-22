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
    
    // MARK: 新建一个空数组
    // var card = Array<Card>()
    var cards_array = [Card]()
    
    
    var indexOfOneAndOnlyFacedUpCard : Int?  // 当前唯一的一张, FacedUp=true 的卡片的index
 
    func chooseCard(at index : Int){
        // cards_array[index].isFaceUp = !cards_array[index].isFaceUp
        if !cards_array[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                if cards_array[index].indentifier == cards_array[matchIndex].indentifier{
                    cards_array[index].isMatched = true
                    cards_array[matchIndex].isMatched = true
                }
                cards_array[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            } else {
                //either no card or 2 cards are faced up
                for flipDownIndex in cards_array.indices{
                    cards_array[flipDownIndex].isFaceUp = false
                }
                cards_array[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = index
            }
            
        }
        
    }
    
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
