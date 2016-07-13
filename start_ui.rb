load 'init.rb'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: start_ui.rb [options]"

  opts.on("-s", "--sfx", "Run with sound effects") do |url|
    options[:sfx] = true
    puts "Sound effects are ON"
  end
end.parse!

ChordStreamer.init_serial_port # for faster streamer on input selection
Input.new(options[:sfx]).monitor
# Input.new(false).monitor