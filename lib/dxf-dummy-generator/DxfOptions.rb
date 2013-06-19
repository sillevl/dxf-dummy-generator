require 'optparse'
require_relative 'Dxfsettings'

class DxfOptions

	def self.parse(args)
		options = {}
		options[:verbose] = false
		options[:dxf] = Dxfsettings.new
		options[:dxf].lines = Dxfsettings::Setting.new(10,false,rand(0..1000))
		options[:dxf].groups = Dxfsettings::Setting.new(1,false,rand(0..1000))
		options[:dxf].contours = Dxfsettings::Setting.new(1,false,rand(0..1000))

		options[:filename] = "default.dxf"


		opt_parser = OptionParser.new do |opts|
		  	opts.banner = "Usage: dfx-dummy-generator.rb [options]"

		  	opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
		    	options[:verbose] = v
		  	end

			opts.on("-l", "--lines [NUMBER]", OptionParser::DecimalInteger,
			    "Number of lines (default: 100)") do |count|
				options[:dxf].lines.count = count
			end
			opts.on("-g", "--groups [NUMBER]", OptionParser::DecimalInteger,
			    "Number of groups per contour (default: 1)") do |count|
				options[:dxf].groups.count = count
			end
			opts.on("-c", "--contours [NUMBER]", OptionParser::DecimalInteger,
			    "Number of contours (default: 1)") do |count|
				options[:dxf].contours.count = count
			end
			opts.on("-L", "--lineseed [NUMBER]", OptionParser::DecimalInteger,
			    "Seed for random line generator (default: random)") do |count|
				options[:dxf].lines.seed = count
			end
			opts.on("-G", "--groupseed [NUMBER]", OptionParser::DecimalInteger,
			    "Seed for random group generator (default: random)") do |count|
				options[:dxf].groupes.seed = count
			end
			opts.on("-C", "--contourseed [NUMBER]", OptionParser::DecimalInteger,
			    "Seed for random contour generator (default: random)") do |count|
				options[:dxf].contours.seed = count
			end

			opts.on("-x", "--randomlines", "Randomly order lines") do |r|
		    	options[:dxf].lines.random = r
		  	end

		  	opts.on("-y", "--randomgroups", "Randomly order line groups") do |r|
		    	options[:dxf].groupes.random = r
		  	end

		  	opts.on("-z", "--randomcontours", "Randomly order contours") do |r|
		    	options[:dxf].contours.random = r
		  	end

			opts.on("-o", "--output FILENAME",
		    	    "Set the filename to output the result") do |filename|
		        options[:filename] = filename
		    end
		end

		opt_parser.parse!(args)
		options
	end
end