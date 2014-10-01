#!/usr/bin/env ruby

require_relative 'flip_flap'

usage = 'Usage:  tsv_to_yml [TSV_file] [YML_file]\n'
fail ArgumentError, usage if ARGV.count == 0

tsv_filename = ARGV[0]
yml_filename = ARGV[1]

tsv = File.read(tsv_filename)
flipper = FlipFlap.new
flipper.take_tsv(tsv)

File.open(yml_filename, 'w') do |file|
  file.puts flipper.to_yaml
end
