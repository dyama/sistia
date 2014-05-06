#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*- 

require 'json'

$world = nil
open("world.json") do |io|
  $world = JSON.load(io)
end

def getmap(id)
  $world.each do |map|
    if map["id"] == id
      return map
    end
  end
  return nil
end

