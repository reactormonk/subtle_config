require 'pathname'
require 'yaml'
module PersistentData
  include Kernel

  FILE  = Pathname.new(ENV['XDG_CONFIG_HOME']) + 'subtle' + 'config.yaml'

  class << self
    attr_accessor :data
  end

  def self.save(data)
    File.open(FILE, 'w') {|file| file.write(data.to_yaml)}
  end

  def self.load
    YAML.load(File.read(FILE)) if FILE.exists?
  end

  on :start do
    self.data = load
  end

  on :reload do
    puts 'reload'
    if load != data
      self.data = load
    else
      save(data)
    end
  end

  on :exit do
    save(data)
  end
end
