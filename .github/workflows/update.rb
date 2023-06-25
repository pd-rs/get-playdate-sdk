#!/usr/bin/env ruby
require 'yaml'

FILEPATH = ARGV[0]

data = YAML.load_file(FILEPATH)
puts data['Installers'][0]['InstallerSha256'] # just to ensure
data['Installers'][0]['InstallerSha256'] = ARGV[1] || data['Installers'][0]['InstallerSha256']
File.write(FILEPATH, data.to_yaml)
