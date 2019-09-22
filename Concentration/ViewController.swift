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
    // game 是 Concentration 类的 一个实例
    lazy var game = Concentration(numberOfPairsOfCards: (cardButons.count + 1 ) / 2 )
    
    
    // 点击的总次数, 值变化的同时,会修改View中的label
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "翻转次数 : \(flipCount) "
        }
    }
    
    // MARK: View与变量的映射
    @IBOutlet weak var flipCountLabel: UILabel!
    // 按钮组 - 是一个array
    @IBOutlet var cardButons: [UIButton]!
    
    // MARK: View 与 按钮的点击事件
    // 由 按钮组 cardButons 触发
    @IBAction func touchCard(_ sender: UIButton) {
        // 点击总次数 +1
        flipCount += 1
        
        /* 若第四个button不mapping 到 cardButons: [UIButton]!,  则 index 返回nil
            1. sender的类型是UIButton
            2. cardNumber的类型是Array<Element>.index
            3. 用firstIndex 找到被点击的卡在cardButons 中对应的位置 (index)
        */
        if let clickedCardIndex = cardButons.firstIndex(of: sender){
            print("cardNumber = \(clickedCardIndex)")
            
            // 仅改变 card的 isFaceup 属性
            game.chooseCard(at: clickedCardIndex)
            // 根据 isFaceup 属性 , 刷新所有 按钮的View
            uptAllBtn_ViewFromModel()
        } else {
            print("若第四个button不mapping 到 cardButons: [UIButton]!,  则 index 返回nil")

        }
        
    }
    
    func uptAllBtn_ViewFromModel() {
        for index in cardButons.indices {
            let button = cardButons[index]
            let card = game.cards_array[index]
            // 根据 card 的 FaceUp 属性, 遍历全部按钮, 更新View
        
            if card.isFaceUp{
                // 如果 Facedup = true , 则 根据词典的index, 显示对应的图标
                button.setTitle(emoji_dict_lokup(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                // 如果 Facedup = false , 则 渲染为 <卡是背面>的状态
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)

            }
        }
    }
    
    // MARK: 颜文字词典
    var emojiChoices_array  = ["🎃","❤️","🏀","👻","🎁","💎","🐷","😈"]
    var emoji_dict = [Int : String ]()
    
    func emoji_dict_lokup(for card : Card) -> String{
        // 如果 某卡 没有对应的图标(nil),且颜文字数组中还有剩余的图标, =》 在词典中新增该卡对应的图标,
        if emoji_dict[card.indentifier] == nil , emojiChoices_array.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices_array.count)))
            //  在词典中新增该卡对应的图标, 同时,在 原来集合中删除该图标,避免下次重复出现
            emoji_dict[card.indentifier] = emojiChoices_array.remove(at: randomIndex)
        }
        
        // 根据 index , 显示对应的图标 , (将option 解包)
        return emoji_dict[card.indentifier] ?? "?"
    }

}

