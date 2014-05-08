#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*- 

require './common.rb'

items = [
  [ ],
  [ ],
  [ ],
]

class Item
  attr_accessor :name, :desc, :drop, :equip, :cate, :onetime
  attr_accessor :plice, :dura

  # コンストラクタ
  def initialize
  end

  # ドロップ可能
  # 装備可能？
  # カテゴリ
  # 効果
  def effect(target)
    raise ""
  end

  # 使用すると消える
  # 耐久度
  # 定価（店頭買取価格）
end

class Herb < Item

  def initialize
    @name = "ちくわ"
    @desc = "体力を少しだけ回復する"
    @drop = true
    @equip = false
    @onetime = true
    @plice = 5
  end

  def effect(target)
    if target.instance_of?(Charactor)
      val = 10
      target.hp += val
      if target.hp > target.maxhp
        target.hp = target.maxhp
      end
      msg target.name + "のHPが" + val.to_s + "回復しました。", true, $cyan
    end
  end

end



