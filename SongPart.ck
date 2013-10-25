public class SongPart
{
  Mandolin instrument ;
  string notes[] ;
  float frequencies[] ;
  dur durations[] ;

  fun void setInstrument(Mandolin an_instrument) { an_instrument @=> instrument ; }

  fun void setNotes(string some_notes[]) { some_notes @=> notes ; }
}
