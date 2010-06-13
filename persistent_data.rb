require 'pathname'
require 'yaml'
module PersistentData
  include Kernel

  class << self
    attr_accessor :data, :filename
  end

  self.filename = Pathname.new(ENV['XDG_CONFIG_HOME']) + 'subtle' + 'config.yaml'

  def self.save(data)
    File.open(filename, 'w') {|file| file.write(data.to_yaml)}
  end

  def self.load
    YAML.load(File.read(filename)) if File.exist?(filename)
  end

  on :start do
    self.data = load
  end

  on :reload do
    loaded = load
    if loaded && loaded['reload']
      self.data = loaded
      data.delete('reload')
    end
    save(data)
  end

  on :exit do
    save(data)
  end
end
