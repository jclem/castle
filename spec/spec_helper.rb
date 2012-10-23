require 'awesome_print'

$: << File.join(File.dirname(__FILE__), '..')

require 'lib/castle'
require 'lib/castle/piece'

Dir['lib/**/*.rb'].each do |file|
  require file unless file == 'lib/castle'
end
