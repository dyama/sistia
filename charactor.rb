#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*- 

require './common.rb'
require './world.rb'
require './item.rb'

class Charactor

  attr_accessor :name,:hp,:maxhp,:sp,:maxsp,:lv,:exp,:gold,:map,:img
  attr_accessor :str,:dex,:vit,:int,:luk,:agi, :items
  attr_accessor :defence

  # コンストラクタ
  def initialize
    @name = ""
    @maxhp = 50
    @hp = @maxhp
    @maxsp = 20
    @sp = @maxsp
    @lv = 1
    @exp = 0
    @gold = 0
    @map = 1   # 現在のマップ
    @str = 10  # 強さ
    @dex = 10  # 器用度
    @vit = 10  # 体力
    @int = 10  # 知力
    @agi = 10  # 敏捷性
    @luk = 10  # 幸運度
    @img = nil # グラフィック
    @items = nil # 所持品
  end

  # キャラクターのステータスを表示
  def show_status
    mapname = getmap(@map)["name"]
    str = ""
    str += "【" + @name + "】"
    str += " Lv:" + @lv.to_s
    str += " HP:" + @hp.to_s + "/" + @maxhp.to_s
    str += " SP:" + @sp.to_s + "/" + @maxsp.to_s
    str += " " + mapname.chomp
    msg str, false, $blue, 0
  end

  # 行動ルーチン
  def action(target)

  end

  # こうげき
  def atack(target)
    power = rand(@str)
    hit = @dex + @agi
    critical = (rand(@luk + target.luk) < @luk / 5)
    if critical
      # かいしんのいちげき
      return power * 2
    else
      targetagi = target.agi
      if target.defence
        targetagi *= 2
      end
      if rand(hit + targetagi) < hit
        return power
      else
        # ミス
        return 0
      end
    end
  end

  # ぼうぎょ
  def do_defence(target)
    if !defence
      return 0
    end

  end

  def additem(item, nb = 1)
    if !item.is_a?(Item)
      raise ""
    end
    if nb < 1
      raise ""
    end
    if @items == nil
      @items = Array.new
    end
    nb.times do |n|
      @items.push(item)
    end
    msg @name + "は" + item.name + "を" + nb.to_s + "個、手に入れました。"
  end

  # 移動
  def move(id = nil)
    if id == nil
      # 対話的な移動
      mapobj = getmap(@map)
      ar = Array.new
      if mapobj['east'] != nil  then ar.push('東') end
      if mapobj['west'] != nil  then ar.push('西') end
      if mapobj['south'] != nil then ar.push('南') end
      if mapobj['north'] != nil then ar.push('北') end
      val = menu(1, true, ar)
      case val
      when '東' then @map = mapobj['east']
      when '西' then @map = mapobj['west']
      when '南' then @map = mapobj['south']
      when '北' then @map = mapobj['north']
      else return
      end
      msg getmap(@map)['name']+"に移動しました。\n"
    else
      # マップIDを指定して移動
      mapobj = getmap(id)
      if id == nil
        # 存在しない
        throw ""
      else
        if @map != mapobj
          @map = mapobj.id
          msg getmap(@map)['name']+"に移動しました。\n"
        else
          # 同じ場所
        end
      end
    end
  end

  # アイテムを使う
  def useitem(itemname = nil)

    if itemname == nil

      menuitem = Array.new
      @items.each do |n|
        menuitem.push n.name
      end

      if menuitem.size < 1
        msg @name + "は何も持っていません。"
        return
      end

      #nb = Array.new
      #menuitem.uniq.each do |n|
      #  a = menuitem.select{|nn| nn == n}.size
      #  nb.push(a)
      #end
      #menuitem2 = menuitem.uniq
      #(0..menuitem2.size - 1).each do |i|
      #  menuitem2[i] += ("×" + nb[i].to_s)
      #end

      msg "どれを使いますか？", false, 0, 0
      itemname = menu(1, true, menuitem)

      if itemname == nil
        return
      end

    end

    found = false
    index = 0
    @items.each do |n|
      if n.name == itemname
        found = true
        break
      end
      index += 1
    end
    if !found
      msg @name + "は" + itemname + "を持っていません。"
      return
    end

    itemobj = @items.slice!(index)
    itemobj.effect(self)

  end

end

