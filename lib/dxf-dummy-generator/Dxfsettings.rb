class Dxfsettings
	class Setting
		def initialize(count, random, seed)
			@count, @random, @seed = count, random, seed
		end
		def count=(count); @count = count; end
		def random=(random); @random = random; end
		def seed=(seed); @seed = seed; end

		def count; @count; end
		def random; @random; end
		def seed; @seed; end
	end

	def lines=(setting)
		@lines = setting
	end
	def groups=(setting)
		@groups = setting
	end
	def contours=(setting)
		@contours = setting
	end

	def lines; @lines; end
	def groups; @groups; end
	def contours; @contours; end
end