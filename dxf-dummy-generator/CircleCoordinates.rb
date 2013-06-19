require_relative 'Point'

class CircleCoordinates
	def initialize(count, center, r)
		@count = count
		@result = Array.new
		@radius = r
		@center = center
	end

	def getCoordinates
		@count.times do |i|
			angle = ((2 * Math::PI) / @count) * i
			@result << Point.new((Math::cos(angle) * @radius) + @center.x, (Math::sin(angle) * @radius) + @center.y)
		end
		@result
	end
end