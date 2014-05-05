#!ruby
# -*- mode:ruby; coding:utf-8 -*- 

class String
  def number?
    self =~ /\A-?\d+(.\d+)?\Z/
  end
end

