#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*- 

require './common.rb'

class Charactor

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

