require "Construct/version"
require 'logger'

module Construct
	# Default constants:
	TEMPLATE_CATEGORY_SEPARATOR = "."
	TEMPLATE_BASE_PATH          = File.expand_path "~/.construct"

	@log = Logger.new STDOUT
	# @log.level = Logger::DEBUG
	@log.datetime_format = "%H:%M:%S"

	class << self
		attr_accessor :log
	end

	def self.init
		log.debug "Initialising construct."

		# Check if default folder exists
		if not Dir.exist? TEMPLATE_BASE_PATH
			# Creating a folder in case we dont have one
			FileUtils.mkdir TEMPLATE_BASE_PATH

			# TODO: Populate default folder with sample templates.

		end
	end
end
