public class Song
{
  float NOTES[128] ; 10 => int HIGHEST_OCTAVE ; 12 => int N_NOTES_PER_OCTAVE ;
  for (1 => int octaveN ; octaveN <= HIGHEST_OCTAVE ; ++octaveN)
  {
    // notes below e1 (20.6hz) will not be triggered and equivelant to rests
    octaveN * N_NOTES_PER_OCTAVE => float c ;

    c        => NOTES["c"  + octaveN] ;
    c + 1.0  => NOTES["c#" + octaveN] ;
    c + 1.0  => NOTES["db" + octaveN] ;
    c + 2.0  => NOTES["d"  + octaveN] ;
    c + 3.0  => NOTES["d#" + octaveN] ;
    c + 3.0  => NOTES["eb" + octaveN] ;
    c + 4.0  => NOTES["e"  + octaveN] ;
    c + 5.0  => NOTES["f"  + octaveN] ;
    c + 6.0  => NOTES["f#" + octaveN] ;
    c + 6.0  => NOTES["gb" + octaveN] ;
    c + 7.0  => NOTES["g"  + octaveN] ;
    if (octaveN == HIGHEST_OCTAVE) continue ;

    c + 8.0  => NOTES["g#" + octaveN] ;
    c + 8.0  => NOTES["ab" + octaveN] ;
    c + 9.0  => NOTES["a"  + octaveN] ;
    c + 10.0 => NOTES["a#" + octaveN] ;
    c + 10.0 => NOTES["bb" + octaveN] ;
    c + 11.0 => NOTES["b"  + octaveN] ;
  }

  dur quarterNote ;
  dur runningTime ;

  fun void setTempo(float tempo)
  {
// <<< "setTempo() tempo=" , tempo >>> ;

    60::second / tempo => quarterNote ;
    0::samp            => dur runningTime ;
  }

  fun void setParts(SongPart parts[])
  {
// <<< "setParts() nParts=" , parts.cap() >>> ;

    StringTokenizer tok ;
    for(0 => int partN ; partN < parts.cap() ; ++partN)
    {
      0::samp => dur time ; parts[partN].notes.cap() => int nNotes ;
      float frequencies[nNotes] ; dur durations[nNotes] ;
      for(0 => int noteN ; noteN < nNotes ; ++noteN)
      {
// <<< "playPart() noteN=" , noteN >>> ;

        tok.set(parts[partN].notes[noteN]) ;
        if (tok.more()) Std.mtof(NOTES[tok.next()])        => frequencies[noteN] ;
        if (tok.more()) Std.atof(tok.next()) * quarterNote => durations[noteN] ;
        durations[noteN] +=> time ;
      }
      frequencies @=> parts[partN].frequencies ; durations @=> parts[partN].durations ;
      if (time > runningTime) time => runningTime ;

      spork ~ playPart(parts[partN]) ;
    }
  }

  fun void playPart(SongPart part)
  {
// <<< "playPart()" >>> ;

    for(0 => int noteN ; noteN < part.notes.cap() ; ++noteN)
    {
// <<< "playPart() noteN=" , noteN >>> ;

      if (part.frequencies[noteN] >= 20.0)
      {
        part.frequencies[noteN] => part.instrument.freq ;
        1.0                     => part.instrument.pluck ;
      }
// <<< "playPart() frequency=" , part.frequencies[noteN] , " duration=" , part.durations[noteN] >>> ;

      part.durations[noteN] => now ;
    }
  }

  fun void play() { runningTime => now ; }
}
