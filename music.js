var musicon = false;
var themusic = new Audio();


function toggle() {
	if (musicon) {
		musicon = false;
		themusic.pause();
	} else {
		musicon = true;
		themusic = new Audio("First Steps.mp3");
		themusic.play();
	}
}