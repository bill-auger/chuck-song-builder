## chuck-song-builder - some chuck classes for notating ditties

the Song and SongPart classes (in Song.ck and SongPart.ck) collaborate to make notating multi-part multi-instrument tunes fairly simple even if you do not know chuck very well

the remaining classes (in Bandedwg.ck, Modalbar.ck, Mooog.ck, Voicform.ck) are examples of how to subclass SongParts

daisy.ck is an example composition in a simple hand-rolled notation that demonstrates how the parts are put together to create an executable score

`play.sh daisy.ck` will play the tune if you have chuck installed or if you are lazy (or just not quite nerdy enough) then just click one of these links to listen to an example:
* [standard mono example](https://bill-auger.github.io/chuck-song-builder/chuck-song-builder-demo.html?daisy-dry-mono.wav)
* [enhanced stereo example](https://bill-auger.github.io/chuck-song-builder/chuck-song-builder-demo.html?daisy-reverb-stereo.wav)

there are loads of clever things that could be done building upon this - just ask chuck --> http://chuck.cs.princeton.edu/
