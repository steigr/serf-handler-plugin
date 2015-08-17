PLUGIN_DIR=$(dirname $(dirname $0))

download() {
	TOFILE=[[ -t 1 ]] && true || false
	URL=${1}
	[[ -x $(which curl) ]] && (
		[[ $TOFILE ]] && save="-O"
		curl -fsSL $save $URL
	)
	[[ -x $(which wget) ]] && (
		[[ $TOFILE ]] || topipe="-O -"
		wget $topipe $URL
	)
}