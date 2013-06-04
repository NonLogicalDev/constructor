module Constructor
	class FileProcessor
		def self.construct
			# there are a few possibilities
			# the template can be:
			# * or a plain file with instructions
			# * a directory
			# * a zip file
			template_type = nil
			if File.exists? requested_template_path
				template_type = :instruction_file
			elsif Dir.exists? requested_template_path
				template_type = :directory
			elsif File.exists? requested_template_path + ".zip"
				template_type = :zip_ball
			else
				puts "Error: the requested template #{requested_template_path} does not exist!"
				exit
			end

			# Now that we know the file type leets act accordingly
			case template_type
			when :instruction_file
				# TODO: Figure out syntax
				#
				# Assumptions to make coding easier for now:
				# * indents are 4 space wide.
				#
				# Every thing that follows # is considered a comment

				File.open( requested_template_path , "r" ) { |template_file|
					# get all lines and delete empty ones
					contents = (template_file.read.split("\n").delete_if { |a| a.empty? })

					# First line must contain type in form of '# Type:<type>'
					# Type acn be either:
					# * constructor - my own script language for this task
					# * shell       - self explanatory really
					script_type = contents.shift.match(%r{Type:\s*(\w+)})[1].to_sym

					# TODO: Write both shell and constructo implementations
				}

			when :directory
				# TODO: Simply copy the directory
			when :zip_ball
				# TODO: Unpack the zip into folder
			end
		end
	end
end