
# set fid [open "C:/Users/Administrator/Desktop/rgyr.txt" w+]
# set num 481

# cd E:/BISHE/LammpsFile/WORK/XYZ2/cylinder/
# for {set i 1} {$i < $num} {incr i} {
	# mol addfile $i.xyz;
	# set a [measure rgyr [atomselect top all]]
	# puts $fid $a
	# flush $fid
	# mol delete top
# }

# cd E:/BISHE/LammpsFile/WORK/XYZ2/sphere/
# for {set i 1} {$i < $num} {incr i} {
	# mol addfile $i.xyz;
	# set a [measure rgyr [atomselect top all]]
	# puts $fid $a
	# flush $fid
	# mol delete top
# }
# close $fid



set fid [open "C:/Users/Dell/Desktop/sasa.txt" w+]
set num 961

cd C:/Users/Dell/Desktop/XYZ/cylinder/
for {set i 1} {$i < $num} {incr i} {
    #puts "I: $i"
	mol addfile $i.xyz;
	#set numframes [molinfo top get numframes]
	#puts $numframes
	#set frame $numframes
	set a [measure sasa 25 [atomselect top all]]
	puts $fid $a
	flush $fid
	mol delete top
}

cd C:/Users/Dell/Desktop/XYZ/sphere/
for {set i 1} {$i < $num} {incr i} {
    #puts "I: $i"
	mol addfile $i.xyz;
	#set numframes [molinfo top get numframes]
	#puts $numframes
	#set frame $numframes
	set a [measure sasa 25 [atomselect top all]]
	puts $fid $a
	flush $fid
	mol delete top
}
close $fid




