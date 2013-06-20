require_relative 'CircleCoordinates'
require_relative 'Line'

class DXF

	def initialize(settings)
		@settings = settings
		@contours = Array.new
		count = settings.contours.count
		lines = (settings.lines.count / count).floor
		r = lines #dynamicly scale circles to avoid precision problems
		order = Array(0..count)
		order = order.shuffle(random: settings.contours.seed) if settings.contours.random
		raster = Math::sqrt(count).ceil
		settings.contours.count.times do |i|
			lines = lines + (settings.lines.count % lines) if i == (settings.contours.count - 1)
			x = 2 * r * 1.1 * (order[i] % raster)
			y = 2 * r * 1.1 * (order[i] / raster)
			center = Point.new(x, y)
			@contours << getLines(lines, center, r)
		end
	end

	def to_s
		header = ["0", "SECTION", "2" , "ENTITIES"]
		footer = ["0", "ENDSEC", "0", "EOF"]
		@contours = @contours.shuffle(random: @settings.lines.seed) if @settings.lines.random
		(header << @contours << footer) * "\n"
	end

	private
	def getLines(count, center, r)
		items = Array.new
		coords = CircleCoordinates.new(count, center, r).getCoordinates
		count.times do |i|
			items << Line.new(coords[i-1], coords[i]).getDXF
		end
		items
	end
end