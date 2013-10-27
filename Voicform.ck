public class Voicform extends SongPart
{
  0.82           => float ON_RATIO ;
  1.0 - ON_RATIO => float OFF_RATIO ;
  [
    "eee" , "ihh" , "ehh" , "aaa" ,
    "ahh" , "aww" , "ohh" , "uhh" ,
    "uuu" , "ooo" , "rrr" , "lll" ,
    "mmm" , "nnn" , "nng" , "ngg" ,
    "fff" , "sss" , "thh" , "shh" ,
    "xxx" , "hee" , "hoo" , "hah" ,
    "bbb" , "ddd" , "jjj" , "ggg" ,
    "vvv" , "zzz" , "thz" , "zhh"
  ] @=> string PHONEMES[] ; 3 => int N_PHONEMES ; -1 => int N ; 0 => int Toggle ;
  VoicForm instrument ;


  fun void setInstrument(VoicForm aVoicForm)
  {
    aVoicForm @=> instrument ;
    "ihh" => instrument.phoneme ;
    6.0   => instrument.vibratoFreq ;
    0.1   => instrument.vibratoGain ;
    1.0   => instrument.pitchSweepRate ;
  }

  fun dur playNote(int noteN)
  {
//if (!Toggle => Toggle) PHONEMES[(N + 1) % N_PHONEMES => N] => instrument.phoneme ; <<< "PHONEMES[" , N , "]=" , PHONEMES[N] >>> ;

    if (frequencies[noteN] >= 20.0)
    {
      frequencies[noteN] => instrument.freq ;
      1.0                => instrument.speak ;
      1.0                => instrument.noteOn ;
    }
    return durations[noteN] * ON_RATIO ;

//<<< "playNote() frequency=" , frequencies[noteN] , " duration=" , durations[noteN] >>> ;
  }

  fun dur stopNote(int noteN) { 1.0 => instrument.noteOff ; 1.0 => instrument.quiet ; return durations[noteN] * OFF_RATIO ; }
}
