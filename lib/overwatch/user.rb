Dir[File.dirname(__FILE__) + '/user/**/*.rb'].each do |file|
  require file
end
