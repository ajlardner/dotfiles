# get the mac address of a paired bluetooth device by selecting from paired devices with dmenu
# uses `bluetoothctl devices Paired` to list paired bt devices
btctl-get-mac-dm () {
	 bluetoothctl devices Paired | dmenu | awk '{print $2}'	

}

# calls `awk` with `'{print $x}'`. in this invocation, x represents the column that should be printed for each line
# $1 = number to be passed to `awk '{print $x}'`
cols () {
	awk "{print \$$1}"
}
