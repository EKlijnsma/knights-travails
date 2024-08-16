# frozen_string_literal: true

require_relative 'lib/knight'

piece1 = Knight.new
start = [0, 0]
target = [7, 0]
path = piece1.knight_moves(start, target)

puts "You made it in #{path.length - 1} moves!  Here's your path:"
path.each { |item| p item }
