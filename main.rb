#!/usr/bin/env ruby
## -*- mode:ruby; coding:utf-8 -*-

require './common.rb'
require './world.rb'
require './charactor.rb'

# メインルーチンが消えた
# 移動ルーチンが消えた
# 戦闘ルーチンが消えた
# ステータス表示ルーチンが消えた

# 移動
def move(id)
  map = getmap(id)
  ar = Array.new
  if map['east'] != nil  then ar.push('東') end
  if map['west'] != nil  then ar.push('西') end
  if map['south'] != nil then ar.push('南') end
  if map['north'] != nil then ar.push('北') end
  val = menu(1, true, ar)
  case val
  when '東' then return map['east']
  when '西' then return map['west']
  when '南' then return map['south']
  when '北' then return map['north']
  else return id
  end
end

# キャラクターのステータスを表示
def show_status(char)
  map = getmap(char.map)["name"]
  print "【" + char.name + "】"
  print " Lv:" + char.lv.to_s
  print " HP:" + char.hp.to_s+"/"+char.maxhp.to_s
  print " SP:" + char.sp.to_s+"/"+char.maxsp.to_s
  print " " + map
  print "\n"
end

# メイン
def main

  player = Charactor.new
  player.name = "太郎"

  menuitem = ["移動", "スキル", "アイテム", "装備"]

  while true
    show_status(player)
    val = menu(0, true, menuitem)
    case val
    when "移動"
      map = move(player.map)
      if map != player.map
        player.map = map
        print getmap(map)['name']+"に移動しました。\n"
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
