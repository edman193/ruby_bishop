#!/usr/bin/ruby

require File.join(File.dirname(__FILE__), 'bishop')

p 'Origin Position: '
origin_positon = gets.strip
p 'Target Position: '
target_positon = gets.strip

bishop = Bishop.new(origin_positon, target_positon)

bishop.movements
