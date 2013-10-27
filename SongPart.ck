public class SongPart
{
  "subclass responsibility - do not instantiate this class" => string ABSTRACT_CLASS_MSG ;
  "index out of range" => string OOB_MSG ; 0::ms => dur ZERO_DURATION ;

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


  string notes[] ;
  float frequencies[] ;
  dur durations[] ;
  dur quarterNote ;
  dur runningTime ;


  fun void setInstrument(Mandolin anInstrument) { <<< ABSTRACT_CLASS_MSG >>> ; }

  fun void setTempo(float tempo)
  {
// <<< "setTempo() tempo=" , tempo >>> ;

    60::second / tempo => quarterNote ;
  }

//   fun void clearNotes() { string empty[] @=> notes ; parseNotes() ; }

  fun void setNotes(string someNotes[]) { someNotes @=> notes ; parseNotes() ; }

  fun void setSomeNotes(string someNotes[] , int fromIdx , int nNewNotes)
    { setNotes(subList(someNotes , fromIdx , nNewNotes)) ; }

  fun void setNote(string note , int idx) { note => notes[idx] ; parseNotes() ; }

  fun void insertNotes(string someNotes[] , int idx)
  {
// <<< "insertNotes() nOldNotes=" , notes.cap() , " nInsertNotes=" , someNotes.cap() , " nNewNotes=" , notes.cap() + someNotes.cap() >>> ;

    if (idx < 0 || idx > notes.cap()) return ;

    notes.cap() => int nOldNotes ; someNotes.cap() => int nNewNotes ;
    string newNotes[nOldNotes + nNewNotes] ;
    for (0   => int i ; i < idx       ; ++i) notes[i]     => newNotes[i] ;
    for (0   => int i ; i < nNewNotes ; ++i) someNotes[i] => newNotes[idx + i] ;
    for (idx => int i ; i < nOldNotes ; ++i) notes[i]     => newNotes[nNewNotes + i] ;
    newNotes @=> notes ; parseNotes() ;

// <<< "insertNotes() nNotesOUT=" , notes.cap() >>> ; for (0 => int i ; i < notes.cap() ; ++i) <<< "notes[" , i , "]='" , notes[i] , "'" >>> ;
  }

  fun string[] subList(string someNotes[] , int fromIdx , int nNewNotes)
  {
// <<< "addSomeNotes() nOldNotes=" , notes.cap() , " fromIdx=" , fromIdx , " nNewNotes=" , nNewNotes  , " of nNotes=" , someNotes.cap() >>> ;

    string newNotes[nNewNotes] ;
    if (nNewNotes < 0 || fromIdx + nNewNotes > someNotes.cap() ||
        fromIdx < 0 || fromIdx >= someNotes.cap()) <<< OOB_MSG >>> ;
    else for (0 => int i ; i < nNewNotes ; ++i) someNotes[fromIdx + i] => newNotes[i] ;

    return newNotes ;
  }

  fun void addSomeNotes(string someNotes[] , int fromIdx , int nNewNotes)
    { insertNotes(subList(someNotes , fromIdx , nNewNotes) , notes.cap()) ; }

  fun void addNotes(string someNotes[]) { addSomeNotes(someNotes , 0 , someNotes.cap()) ; }

  fun void parseNotes()
  {
// <<< "parseNotes() nNotes=" , notes.cap() >>> ;

    notes.cap() => int nNotes ; StringTokenizer tok ;
    float freqs[nNotes] ; dur durs[nNotes] ; 1::samp => dur time ;
    for(0 => int noteN ; noteN < nNotes ; ++noteN)
    {
// <<< "parseNotes() noteN=" , noteN >>> ;

      tok.set(notes[noteN]) ;
      if (tok.more()) Std.mtof(NOTES[tok.next()])        => freqs[noteN] ;
      if (tok.more()) Std.atof(tok.next()) * quarterNote => durs[noteN] ;
      durs[noteN] +=> time ;
    }
    freqs @=> frequencies ; durs @=> durations ; time => runningTime ;

// <<< "parseNotes() nFrequencies=" , frequencies.cap() , " nDurations=" , durations.cap() , " runningTime=" , runningTime >>> ;
  }

  fun dur playNote(int noteN) { <<< ABSTRACT_CLASS_MSG >>> ; return ZERO_DURATION ; }

  fun dur stopNote(int noteN) { <<< ABSTRACT_CLASS_MSG >>> ; return ZERO_DURATION ; }
}
