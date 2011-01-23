require 'irb/completion'
require 'pp'

begin
  require 'wirble'

  # start wirble (with color)
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Wirble is unavailble"
end

IRB.conf[:AUTO_INDENT]=true

