public class Mooog extends SongPart
{
  0.9            => float ON_RATIO ;
  1.0 - ON_RATIO => float OFF_RATIO ;


  Moog instrument ;


  fun void setInstrument(Moog aMoog) { aMoog @=> instrument ; }

  fun dur playNote(int noteN)
  {
    if (frequencies[noteN] >= 20.0)
    {
      frequencies[noteN] => instrument.freq ;
      1.0                => instrument.noteOn ;
    }
    return durations[noteN] * ON_RATIO ;

//<<< "playNote() frequency=" , frequencies[noteN] , " duration=" , durations[noteN] >>> ;
  }

  fun dur stopNote(int noteN)
  {
    1.0 => instrument.noteOff ; return durations[noteN] * OFF_RATIO ;

//<<< "playNote() frequency=" , frequencies[noteN] , " duration=" , durations[noteN] >>> ;
  }
}
