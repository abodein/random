#!/usr/bin/perl -w

@hexa = ('0'..'9','a'..'f'); 

$len = 12;
$mac = "";

while ($len--){
	if  ($len%2) {
		$mac .= ":";
	}
	else{
		for (0..1){$mac .= $hexa[rand @hexa];}
	}
}
$mac =~ s/^.//;

print "new mac : $mac\n";
system ("sudo ifconfig en0 ether $mac");
system ("sudo ifconfig en0 ether down");
system ("sudo ifconfig en0 ether up");

exit;