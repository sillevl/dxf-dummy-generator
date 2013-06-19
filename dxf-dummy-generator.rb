require 'optparse'
require_relative 'dxf-dummy-generator/DxfOptions'
require_relative 'dxf-dummy-generator/Dxf'


options = DxfOptions.parse(ARGV)
filename = Time.now.strftime("%Y%m%d%H%M%S").to_s
filename += "_" + options[:dxf].lines.count.to_s
filename += "r" + options[:dxf].lines.seed.to_s if options[:dxf].lines.random
filename += "_" + options[:dxf].groups.count.to_s
filename += "r" + options[:dxf].groups.seed.to_s if options[:dxf].groups.random
filename += "_" + options[:dxf].contours.count.to_s
filename += "r" + options[:dxf].contours.seed.to_s if options[:dxf].contours.random
filename += ".dxf"
filename = options[:filename].to_s unless options[:filename] == "default.dxf"
dxf = DXF.new(options[:dxf])

if options[:verbose]
	puts "Seed for random line generator: " + options[:dxf].lines.seed.to_s if options[:dxf].lines.count > 1 && options[:dxf].lines.random
	puts "Seed for random group generator: " + options[:dxf].groups.seed.to_s if options[:dxf].groups.count > 1 && options[:dxf].groups.random
	puts "Seed for random contour generator: " + options[:dxf].contours.seed.to_s if options[:dxf].contours.count > 1 && options[:dxf].contours.random
	puts "Creating dxf file with " + options[:dxf].lines.count.to_s + " Lines"
	puts "Writing to file " + filename
end



#File.open(filename, 'w') { |file| file.write(dxf.to_s) }

#p options






