$: << File.join(File.dirname(__FILE__), '..')

require 'lib/castle'

Dir['lib/**/*.rb'].each do |file|
  require file unless file == 'lib/castle'
end
