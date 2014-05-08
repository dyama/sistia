#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require './common.rb'
require './world.rb'
require './charactor.rb'
require './img.rb'
require './item.rb'
require './battle.rb'

# メイン
def main

  player = Charactor.new
  player.name = "王さま"
  player.map = 11

  player.items = Array.new
  player.items.push(Herb.new)
  player.items.push(Herb.new)

  player.additem(Herb.new, 2)

  menuitem = ["移動", "デバッグ",  "スキル", "アイテム", "戦闘テスト", "装備"]

  while true

    player.show_status
    val = menu(0, true, menuitem)

    case val
      when "移動"
        player.move
      when "スキル"
        ;
      when "アイテム"
        player.useitem
      when "戦闘テスト"
        battle(player)
        if player.hp <= 0
          break
        end
      else
        if val != nil 
          print val + "\n"
        else
          break
        end
    end

  end

end

main

