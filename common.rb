#!ruby
# -*- mode:ruby; coding:utf-8 -*- 

class String
  def number?
    self =~ /\A-?\d+(.\d+)?\Z/
  end
end

# キー
$kl = ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l' ]

# 色
$red    = 1
$green  = 2
$yellow = 3
$blue   = 4
$purple = 5
$cyan   = 6

# メニュー
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
      print "Q:キャンセル"
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

# メッセージ
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
      print msg
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
