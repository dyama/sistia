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

