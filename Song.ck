public class Song
{
  fun void playParts(SongPart parts[])
  {
// <<< "setParts() nParts=" , parts.cap() >>> ;

    now => time begin ; now => time endTime ;
    for(0 => int partN ; partN < parts.cap() ; ++partN)
    {
      parts[partN] @=> SongPart part ; begin + part.runningTime => time partEndTime ;
      if (partEndTime > endTime) partEndTime => endTime ;
      spork ~ playPart(part , endTime) ;
    }
    play(endTime) ;
  }

  fun void playPart(SongPart part , time endTime)
  {
// <<< "playPart() nNotes=" , part.notes.cap() >>> ;

    for(0 => int noteN ; noteN < part.notes.cap() ; ++noteN)
    {
// <<< "playPart() noteN=" , noteN , " dur=" , part.durations[noteN] >>> ;

      part.playNote(noteN) => now ; part.stopNote(noteN) => now ;
    }
    endTime => now ;
  }

  fun void play(time endTime) { endTime => now ; }
}
