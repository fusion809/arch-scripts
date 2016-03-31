# Push changes
function pushat {
	git add *.cson LICENSE.md && git commit -m "$1" && git push origin master
}
