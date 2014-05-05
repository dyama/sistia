#!ruby
# -*- mode:ruby; coding:utf-8 -*- 

class String
  def number?
    self =~ /\A-?\d+(.\d+)?\Z/
  end
end

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

