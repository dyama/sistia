#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*- 

$world = [
  { "id" => 1, "north" => nil, "south" => nil, "west"  => nil, "east"  =>   2, "name" => "西の湿原",   },
  { "id" => 2, "north" => nil, "south" => nil, "west"  =>   1, "east"  =>   3, "name" => "小さな森",   },
  { "id" => 3, "north" =>   4, "south" =>   5, "west"  =>   2, "east"  => nil, "name" => "野道",       },
  { "id" => 4, "north" =>   6, "south" =>   3, "west"  => nil, "east"  => nil, "name" => "静かな草原", },
  { "id" => 5, "north" =>   3, "south" => nil, "west"  => nil, "east"  => nil, "name" => "池のほとり", },
  { "id" => 6, "north" => nil, "south" =>   4, "west"  => nil, "east"  => nil, "name" => "廃村の入口", },
]

def getmap(id)
  $world.each do |map|
    if map["id"] == id
      return map
    end
  end
  return nil
end

