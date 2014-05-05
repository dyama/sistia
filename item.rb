#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*- 

require './common.rb'

items = [
  [ ],
  [ ],
  [ ],
]

class Item
  attr_accessor :str

  # コンストラクタ
  def initialize

  end

  # ドロップ可能
  def drop?
    @drop
  end

  # 装備可能？
  def equip
    @equip
  end

  # カテゴリ
  def category
    @cate
  end

  # 効果
  def effect(target)

  end

  # 説明
  def description

  end

  # 使用すると消える
  def onetime
    true
  end

  # 耐久度
  # 定価（店頭買取価格）


end

