public class SongPart
{
  Mandolin instrument ;
  float notes[][] ;

  fun Mandolin getInstrument() { return instrument ; }

  fun void setInstrument(Mandolin an_instrument) { an_instrument @=> instrument ; }

  fun float[][] getNotes() { return notes ; }

  fun void setNotes(float some_notes[][]) { some_notes @=> notes ; }
}
