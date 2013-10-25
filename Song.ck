public class Song
{
  float NOTES[128] ; 10 => int HIGHEST_OCTAVE ; 12 => int N_NOTES_PER_OCTAVE ;
  for(0 => int octaveN ; octaveN <= HIGHEST_OCTAVE ; ++octaveN)
  {
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
/*
  0.0  => NOTES["rest"] ;
  60.0 => NOTES["c4"] ;     72.0 => NOTES["c5"] ;
  61.0 => NOTES["c#4"] ;    73.0 => NOTES["c#5"] ;
  62.0 => NOTES["d4"] ;     74.0 => NOTES["d5"] ;
  63.0 => NOTES["d#4"] ;    75.0 => NOTES["d#5"] ;
  64.0 => NOTES["e4"] ;     76.0 => NOTES["e5"] ;
  65.0 => NOTES["f4"] ;     77.0 => NOTES["f5"] ;
  66.0 => NOTES["f#4"] ;    78.0 => NOTES["f#5"] ;
  67.0 => NOTES["g4"] ;     79.0 => NOTES["g5"] ;
  68.0 => NOTES["g#4"] ;    80.0 => NOTES["g#5"] ;
  69.0 => NOTES["a4"] ;     81.0 => NOTES["a5"] ;
  70.0 => NOTES["a#4"] ;    82.0 => NOTES["a#5"] ;
  71.0 => NOTES["b4"] ;     83.0 => NOTES["b5"] ;
*/

  Event readyEvent ;
  dur quarterNote ;

  fun void setTempo(float tempo) { 60::second / tempo => quarterNote ; }

  fun void setParts(SongPart parts[])
  {
    for(0 => int partN ; partN < parts.cap() ; ++partN)
      spork ~ playPart(parts[partN]) ;
  }

  fun void playPart(SongPart part)
  {
    StringTokenizer tok ; float note ; float duration ;
    for(0 => int noteN ; noteN < part.notes.cap() ; ++noteN)
    {
      tok.set(part.notes[noteN]) ;
      if (tok.more()) NOTES[tok.next()] => note ; else continue ;
      if (tok.more()) Std.atof(tok.next()) => duration ; else continue ;

      if (note)
      {
        Std.mtof(note) => part.instrument.freq ;
        1.0 => part.instrument.pluck ;
      }
      duration * quarterNote => now ;

//<<< "note=" , note , " duration=" , duration >>> ;
    }

    readyEvent.broadcast() ;
  }

  fun void play() { readyEvent => now ; }
}
