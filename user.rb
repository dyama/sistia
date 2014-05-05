#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*- 

require './common.rb'

class User

  attr_accessor :name,:hp,:maxhp,:sp,:maxsp,:lv,:exp,:gold,:map,:img
  attr_accessor :str,:dex,:vit,:int,:luk,:agi
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
      if rand(hit + target.agi) < hit
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

end

require './world.rb'


$kl = ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l' ]

def menu(nest, usecancel, item)
  if $kl.size < item.size
    throw
  end
  val = ""
  until $kl.index(val)
    i = 0
    item.each do |n|
      print "" + $kl[i].upcase + ":" + n + "  "
      i = i + 1
    end
    if usecancel
      print "Q:戻る"
    end
    print "\n" + ">" * (nest+1) + " "
    val = gets.chomp
    val.downcase!
    if usecancel && val == 'q'
      return nil
    end
  end
  item[$kl.index(val)]
end

def event
  scn = [
    "むかしむかしあるところに、お爺さんとお婆さんが住んでいました。",
    "ある日、お爺さんは山に芝刈りに、お婆さんは川へ洗濯に行きました。",
    "お婆さんが川で洗濯をしていると・・・",
  ]
  print "\e[36;1m"
  scn.each do |msg|
    msg.each_char do |c|
      print c
      sleep 0.1
    end
    print ">"
    gets
  end
  print "\e[0m"
end

def printimg(file)
  File.open(file) do |f|
    buf = f.read
    cur = nil
    buf.each_char do |c|
      if c.number?




