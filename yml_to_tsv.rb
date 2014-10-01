#!/usr/bin/env ruby

require_relative 'flip_flap'

usage = "Usage:  yml_to_tsv [yml_file] [tsv_file]\n"
fail ArgumentError, usage if ARGV.count < 2

yml_filename = ARGV[0]
tsv_filename = ARGV[1]

flipper = FlipFlap.new
flipper.take_yaml(File.read(yml_filename))

tsv = flipper.to_tsv

File.write(tsv_filename, tsv)
