#!/usr/bin/env ruby
## -*- mode:ruby; coding:utf-8 -*-

require './common.rb'
require './world.rb'
require './charactor.rb'
require './img.rb'

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
  str = ""
  str += "【" + char.name + "】"
  str += " Lv:" + char.lv.to_s
  str += " HP:" + char.hp.to_s+"/"+char.maxhp.to_s
  str += " SP:" + char.sp.to_s+"/"+char.maxsp.to_s
  str += " " + map.chomp
  msg str, false, 6, 0
end

def battle(player, mob = nil)

  if mob == nil
    mob = Charactor.new
    mob.name = "スライム"
    mob.img = "./mob.map"
    mob.maxhp = 10
    mob.hp = 10
  end

  msg mob.name + "があらわれた！\n"
  if mob.img != nil
    printimg mob.img
  end

  menuitem = ["攻撃", "防御", "スキル", "アイテム", "逃げる"]

  while mob.hp > 0 && player.hp > 0

    show_status(player)

    # プレイヤーフェイズ
    val = menu(1, false, menuitem)
    case val
    when "攻撃"
      msg player.name + "の攻撃！..."
      pw = player.atack(mob)
      if pw > 0
        if pw > player.str
          msg "かいしんのいちげき！"
        end
        msg mob.name + "に" + pw.to_s + "のダメージ！\n"
        mob.hp -= pw
      else
        msg "ミス！\n"
      end
    when "逃げる"
      return
    else
    end

    show_status(mob)

    # エネミーフェイズ
    msg mob.name + "の攻撃！..."
    pw = mob.atack(player)
    if pw > 0
      if pw > mob.str
        msg "かいしんのいちげき！"
      end
      msg player.name + "に" + pw.to_s + "のダメージ！\n"
      player.hp -= pw
    else
      msg "ミス！\n"
    end

  end

  if player.hp <= 0
    msg player.name + "は死んでしまった…。\n"
  else
    msg mob.name + "を倒した！\n"
  end

end

def msg(text, wait = false, color = 0, delay = 0.05)

  scn = Array.new

  if text.instance_of?(String)
    val = text.rstrip.split(/\r?\n/).map {|line|line.chomp}
    if val.size == 1
      scn.push(val[0])
    else
      scn = val
    end
  elsif text.instance_of?(Array)
    scn = text
  else
    throw ""
  end

  if color != 0
    print "\e[3" + color.to_s + ";1m"
  end
  scn.each do |msg|
    if delay > 0
      msg.each_char do |c|
        print c
        sleep delay
      end
    else
      print msg + "\n"
    end
    if wait
      print ">"
      gets
    else
      puts ""
    end
  end
  if color != 0
    print "\e[0m"
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
        msg getmap(map)['name']+"に移動しました。\n"
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

