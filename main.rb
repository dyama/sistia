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
  res = 0;
  case val
  when '東' then res = map['east']
  when '西' then res = map['west']
  when '南' then res = map['south']
  when '北' then res = map['north']
  else return id
  end
  print map['name']+"に移動しました。\n"
  return res
end

# メイン
def main

  player = Charactor.new

  while true
    val = menu(0, true, ["移動", "bar", "baz"])
    case val
    when "移動" then
      player.map = move(player.map)
    when "bar" then
      print val+"\n"
    when "baz" then
      print val+"\n"
    else
      break
    end
  end

end

main
