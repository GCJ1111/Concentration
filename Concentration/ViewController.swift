//
//  ViewController.swift
//  Concentration
//
//  Created by 龚晨杰 on 2019/6/21.
//  Copyright © 2019 龚晨杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 按照View中按钮的数量, 初始化 游戏.
    lazy var game = Concentration(numberOfPairsOfCards: (cardButons.count + 1 ) / 2 )
    
    
    // 点击的总次数, 值变化的同时,会修改View中的label
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount) "
        }
    }
    
    // MARK: View与变量的映射
    @IBOutlet weak var flipCountLabel: UILabel!
    // 按钮组 - 是一个array
    @IBOutlet var cardButons: [UIButton]!
    
    // MARK: View 与 按钮的点击事件
    // 由 按钮组 cardButons 触发
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1

        /// 若第四个button不mapping 到 cardButons: [UIButton]!,  则 index 返回nil
        if let cardNumber = cardButons.firstIndex(of: sender){
            print("cardNumber = \(cardNumber)")
//            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("若第四个button不mapping 到 cardButons: [UIButton]!,  则 index 返回nil")

        }
        
    }
    
    func updateViewFromModel() {
        for index in cardButons.indices {
            let button = cardButons[index]
            let card = game.cards_array[index]
            // 根据 card 的 FaceUp 属性, 遍历全部按钮, 更新View
        
            if card.isFaceUp{
                button.setTitle(emoji_dict_lokup(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)

            }
        }
    }
    
    var emojiChoices_array  = ["🎃","❤️","🏀","👻","🎁"]
    
    var emoji_dict = [Int : String ]()
    
    
    func emoji_dict_lokup(for card : Card) -> String{
        
        // 如果 index 查不到对应的key,则 新增词典
        if emoji_dict[card.indentifier] == nil , emojiChoices_array.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices_array.count)))
            emoji_dict[card.indentifier] = emojiChoices_array.remove(at: randomIndex)
        }
        
        // 根据 index , 返回 key , (将option 解包)
        return emoji_dict[card.indentifier] ?? "?"
        
    }

 
    

}

