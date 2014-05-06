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

def battle(player)

  mob = Charactor.new
  mob.name = "スライム"

  print mob.name + "があらわれた！\n"

  menuitem = ["攻撃", "防御", "スキル", "アイテム", "逃げる"]

  while mob.hp > 0 && player.hp > 0
    show_status(player)
    # プレイヤーフェイズ
    val = menu(1, false, menuitem)
    case val
    when "攻撃"
      print player.name + "の攻撃！..."
      pw = player.atack(mob)
      if pw > 0
        print "\a"
        if pw > player.str
          print "かいしんのいちげき！"
        end
        print mob.name + "に" + pw.to_s + "のダメージ！\n"
        mob.hp -= pw
      else
        print "ミス！\n"
      end
    when "逃げる"
      return
    else
    end

    # エネミーフェイズ
    print mob.name + "の攻撃！..."
    pw = mob.atack(player)
    if pw > 0
      print "\a"
      if pw > mob.str
        print "かいしんのいちげき！"
      end
      print player.name + "に" + pw.to_s + "のダメージ！\n"
      player.hp -= pw
    else
      print "ミス！\n"
    end

  end

  if player.hp <= 0
    print player.name + "は死んでしまった…。\n"
  else
    print mob.name + "を倒した！\n"
  end

end

# メイン
def main

  player = Charactor.new
  player.name = "太郎"

  menuitem = ["移動", "スキル", "アイテム", "戦闘テスト", "装備"]

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
    when "戦闘テスト"
      battle(player)
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
