#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require './common.rb'
require './world.rb'
require './charactor.rb'
require './img.rb'
require './item.rb'

def battle(player, mob = nil)

  if mob == nil
    mob = Charactor.new
    mob.name = "スライム"
    mob.img = "./mob.map"
    mob.maxhp = 10
    mob.hp = 10
  end

  def bmsg(text)
    msg text, false, $yellow
  end

  bmsg mob.name + "があらわれました！\n"
  if mob.img != nil
    #printimg mob.img
  end

  menuitem = ["攻撃", "防御", "スキル", "アイテム", "逃げる"]

  while mob.hp > 0 && player.hp > 0

    player.show_status

    # プレイヤーフェイズ
    val = menu(1, false, menuitem)
    case val
    when "攻撃"
      bmsg player.name + "の攻撃！"
      pw = player.atack(mob)
      if pw > 0
        if pw > player.str
          bmsg "かいしんのいちげき！"
        end
        bmsg mob.name + "に" + pw.to_s + "のダメージ！\n"
        mob.hp -= pw
      else
        bmsg "ミス！\n"
      end
    when "防御"
      player.defence = true
      bmsg player.name + "は身構えています。"
    when "逃げる"
      bmsg player.name + "は逃げ出しました。"
      return
    else
    end

    if mob.hp > 0
      mob.show_status
      # エネミーフェイズ
      bmsg mob.name + "の攻撃！"
      pw = mob.atack(player)
      if pw > 0
        if pw > mob.str
          bmsg "かいしんのいちげき！"
        end
        bmsg player.name + "に" + pw.to_s + "のダメージ！\n"
        player.hp -= pw
      else
        bmsg "ミス！\n"
      end
    end

  end

  if player.hp <= 0
    bmsg player.name + "は死んでしまいました・・・。\n"
  else
    bmsg mob.name + "を倒しました！\n"
  end

end

