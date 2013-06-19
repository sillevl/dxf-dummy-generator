require_relative 'Point'

class Line

	def initialize(startPoint, endPioint)
		@startPoint, @endPioint = startPoint, endPioint
	end

	def getDXF
		[ "0", "LINE", "8", "0", "10", @startPoint.x, "20", @startPoint.y , "11", @endPioint.x, "21", @endPioint.y]
	end

	def to_s
		"[" + startPoint.to_s + endPioint.tos + "]"
	end

end