#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*- 

require './common.rb'

def printimg(file)
  File.open(file) do |f|
    buf = f.read
    cur = nil
    buf.each_char do |c|
      if c.number?
        if cur != c
          print "\e[4" + c + ";1m "
          cur = c
        else
          print " "
        end
      else
        print "\n"
      end
    end
    print "\e[0m"
  end
end

ARGV.each do |file|
  printimg file
  puts "---"
end

