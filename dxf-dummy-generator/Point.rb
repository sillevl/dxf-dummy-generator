class Point
	def initialize(x,y)
		@x, @y = x, y
	end

	def x; @x; end
	def y; @y; end

	def to_s
		"("+@x.to_s+","+@y.to_s+")"
	end
end