#!/bin/fish

function ws
# # Check if there are at least two arguments, or no arguments at all.
# if [ (count $argv) -eq 0 ]
# 	# echo "Usage: ws [ switch workspace | add file [ file2 file3 ... ] ]"
# 	echo "ws must be sourced!"

# # If no arugments are given, cd to current workspace.
# else if [ (count $argv) -eq 1 ]
# 	cd $ws

# Switch to workspace X
if [ $argv[1] = "switch" ] 
	
	# This command can only be used with a total of two arguments (including switch)
	if [ (count $argv) -ne 2 ]
		echo "You can only switch to one workspace."

	# If exactly two arguments are given, set the ws variable and create it if it doesn't exist yet.
	else
		set ws $HOME/ws/$argv[2]/
		if [ ! -d $ws ]
			mkdir -p $ws
		end
	end
		
# Add files or directories to a workspace.
else if [ $argv[1] = "add" ]
	
	# Iterate over every argument that comes after add.
	for i in $argv[2..-1]
		# If the target is a file and it is on the same partition as the ws dir, create a hardlink.
		if [ -f $i ] ; and [ "(df $i | tail -n 1 | cut -d " " -f 1)" = "(df $ws | tail -n 1 | cut -d " " -f 1)" ]
			ln $i $s/$i
		# Otherwise. make it a symbolic link.
		else
			ln -s (realpath $i) $ws/(basename $i)
		end
	end

else
	cd $ws

end
end

