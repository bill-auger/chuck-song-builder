public class Bandedwg extends SongPart
{
  0.75           => float ON_RATIO ;
  1.0 - ON_RATIO => float OFF_RATIO ;

  0 => int UNIFORM_BAR ;
  1 => int TUNED_BAR ;
  2 => int GLASS_HARMONICA ;
  3 => int TIBETAN_BOWL ;


  BandedWG instrument ;


  fun void setInstrument(BandedWG aBandedWG)
  {
    aBandedWG @=> instrument ;
    0 => instrument.preset ;
  }

  fun dur playNote(int noteN)
  {
//if (!Toggle => Toggle) PHONEMES[(N + 1) % N_PHONEMES => N] => instrument.phoneme ; <<< "PHONEMES[" , N , "]=" , PHONEMES[N] >>> ;

    if (frequencies[noteN] >= 20.0)
    {
      frequencies[noteN] * 1 => instrument.freq ;
//      1.0                => instrument.startBowing ;
      1.0                => instrument.noteOn ;
      1.0                => instrument.pluck ;
    }
    return durations[noteN] * ON_RATIO ;

//<<< "playNote() frequency=" , frequencies[noteN] , " duration=" , durations[noteN] >>> ;
  }

  fun dur stopNote(int noteN) { 1.0 => instrument.noteOff ; 1.0 => instrument.stopBowing ; return durations[noteN] * OFF_RATIO ; }
}
