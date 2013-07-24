module SwfHelper

	def swf_tag(path)
	  "<embed src=\'path/to/resource\' />".html_safe
	end

end