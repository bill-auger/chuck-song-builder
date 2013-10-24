// patch
Mandolin s1 => JCRev r => dac;
Mandolin s2 => r;

// initial settings
.6 => s1.gain;
.4 => s2.gain;
.9 => r.gain;
.2 => r.mix;

// We use musical tempo, and symbolic durations
160                => int tempo ;
60::second / tempo => dur quarterNote ;

60.0 => float c4 ;     72.0 => float c5 ;
61.0 => float cs4 ;    73.0 => float cs5 ;
62.0 => float d4 ;     74.0 => float d5 ;
63.0 => float ds4 ;    75.0 => float ds5 ;
64.0 => float e4 ;     76.0 => float e5 ;
65.0 => float f4 ;     77.0 => float f5 ;
66.0 => float fs4 ;    78.0 => float fs5 ;
67.0 => float g4 ;     79.0 => float g5 ;
68.0 => float gs4 ;    80.0 => float gs5 ;
69.0 => float a4 ;     81.0 => float a5 ;
70.0 => float as4 ;    82.0 => float as5 ;
71.0 => float b4 ;     83.0 => float b5 ;

class Song
{
  Event readyEvent ;
//  SongPart parts[] ;

  fun void playPart(SongPart part , float transpose)
  {
    for(0 => int noteN ; noteN < part.notes.cap() ; ++noteN)
    {
      part.notes[noteN][0] => float note ;
      part.notes[noteN][1] => float duration ;
      if (note)
      {
        Std.mtof(note + transpose) => part.instrument.freq ;
        1.0 => part.instrument.pluck ;
      }
      duration * quarterNote => now ;
    }
    readyEvent.broadcast() ;
  }

  fun void play()
  {
    readyEvent => now ;
  }

//   fun SongPart[] getParts() { return parts ; }

  fun void setParts(SongPart parts[])
  {
[0.0 , -12.0] @=> float transpose[] ;

    for(0 => int partN ; partN < parts.cap() ; ++partN)
      spork ~ playPart(parts[partN] , transpose[partN]) ;
  }

}

public class SongPart
{
  Mandolin instrument ;
  float notes[][] ;

  fun Mandolin getInstrument() { return instrument ; }

  fun void setInstrument(Mandolin an_instrument) { an_instrument @=> instrument ; }

  fun float[][] getNotes() { return notes ; }

  fun void setNotes(float some_notes[][]) { some_notes @=> notes ; }
}


SongPart hiPart ;
hiPart.setInstrument(s1) ;
hiPart.setNotes(
[[a4,1.0],
 [c5,2.0],[d5,1.0],[e5,1.5],[f5,0.5], [e5,1.0], [d5,2.0], [b4,1.0], [g4,1.5],[a4,0.5],[b4,1.0],
 [c5,2.0],[a4,1.0],[a4,1.5],[gs4,0.5],[a4,1.0], [b4,2.0], [gs4,1.0],[e4,2.0],[a4,1.0],
 [c5,2.0],[d5,1.0],[e5,1.5],[f5,0.5], [e5,1.0], [d5,2.0], [b4,1.0], [g4,1.5],[a4,0.5],[b4,1.0],
 [c5,1.5],[b4,0.5],[a4,1.0],[gs4,1.5],[fs4,0.5],[gs4,1.0],[a4,3.0], [a4,3.0],
 [g5,2.0],[g5,1.0],[g5,1.5],[f5,0.5], [e5,1.0], [d5,2.0], [b4,1.0], [g4,1.5],[a4,0.5],[b4,1.0],
 [c5,2.0],[a4,1.0],[a4,1.5],[gs4,0.5],[a4,1.0], [b4,2.0], [gs4,1.0],[e4,2.0],[e4,1.0],
 [g5,2.0],[g5,1.0],[g5,1.5],[f5,0.5], [e5,1.0], [d5,2.0], [b4,1.0], [g4,1.5],[a4,0.5],[b4,1.0],
 [c5,1.5],[b4,0.5],[a4,1.0],[gs4,1.5],[fs4,0.5],[gs4,1.0],[a4,3.0], [a4,3.0]]
) ;

SongPart loPart ;
loPart.setInstrument(s2) ;
loPart.setNotes(
[[0.0,1.0],
 [a4,2.0],[b4,1.0],[c5,3.0],[g4,3.0],[b4,3.0],
 [a4,3.0],[f5,3.0],[e5,3.0],[e4,3.0],
 [a4,2.0],[b4,1.0],[c5,3.0],[g4,3.0],[b4,3.0],
 [a4,3.0],[e4,3.0],[a4,3.0],[a4,3.0],
 [c5,3.0],[c5,3.0],[g4,3.0],[b4,3.0],
 [a4,3.0],[f5,3.0],[e5,3.0],[e4,3.0],
 [c5,3.0],[c5,3.0],[g4,3.0],[b4,3.0],
 [a4,3.0],[e4,3.0],[a4,3.0],[a4,3.0]]
) ;
/*
60.0 => NOTES['c4'] ;     72.0 => NOTES['c5'] ;
61.0 => NOTES['c#4'] ;    73.0 => NOTES['c#5'] ;
62.0 => NOTES['d4'] ;     74.0 => NOTES['d5'] ;
63.0 => NOTES['d#4'] ;    75.0 => NOTES['d#5'] ;
64.0 => NOTES['e4'] ;     76.0 => NOTES['e5'] ;
65.0 => NOTES['f4'] ;     77.0 => NOTES['f5'] ;
66.0 => NOTES['f#4'] ;    78.0 => NOTES['f#5'] ;
67.0 => NOTES['g4'] ;     79.0 => NOTES['g5'] ;
68.0 => NOTES['g#4'] ;    80.0 => NOTES['g#5'] ;
69.0 => NOTES['a4'] ;     81.0 => NOTES['a5'] ;
70.0 => NOTES['a#4'] ;    82.0 => NOTES['a#5'] ;
71.0 => NOTES['b4'] ;     83.0 => NOTES['b5'] ;

["a4,1.0",
 "c5,2.0","d5,1.0","e5,1.5","f5,0.5", "e5,1.0", "d5,2.0", "b4,1.0", "g4,1.5","a4,0.5","b4,1.0",
 "c5,2.0","a4,1.0","a4,1.5","g#4,0.5","a4,1.0", "b4,2.0", "g#4,1.0","e4,2.0","a4,1.0",
 "c5,2.0","d5,1.0","e5,1.5","f5,0.5", "e5,1.0", "d5,2.0", "b4,1.0", "g4,1.5","a4,0.5","b4,1.0",
 "c5,1.5","b4,0.5","a4,1.0","g#4,1.5","f#4,0.5","g#4,1.0","a4,3.0", "a4,3.0",
 "G,2.0","G,1.0","G,1.5","f5,0.5", "e5,1.0", "d5,2.0", "b4,1.0", "g4,1.5","a4,0.5","b4,1.0",
 "c5,2.0","a4,1.0","a4,1.5","g#4,0.5","a4,1.0", "b4,2.0", "g#4,1.0","e4,2.0","e4,1.0",
 "G,2.0","G,1.0","G,1.5","f5,0.5", "e5,1.0", "d5,2.0", "b4,1.0", "g4,1.5","a4,0.5","b4,1.0",
 "c5,1.5","b4,0.5","a4,1.0","g#4,1.5","f#4,0.5","g#4,1.0","a4,3.0", "a4,3.0"] @=> string voice1[] ;

["0.0,1.0",
 "a4,2.0","b4,1.0","c5,3.0","g4,3.0","b4,3.0",
 "a4,3.0","f5,3.0","e5,3.0","e4,3.0",
 "a4,2.0","b4,1.0","c5,3.0","g4,3.0","b4,3.0",
 "a4,3.0","e4,3.0","a4,3.0","a4,3.0",
 "c5,3.0","c5,3.0","g4,3.0","b4,3.0",
 "a4,3.0","f5,3.0","e5,3.0","e4,3.0",
 "c5,3.0","c5,3.0","g4,3.0","b4,3.0",
 "a4,3.0","e4,3.0","a4,3.0","a4,3.0"] @=> string voice2[] ;
*/
/*
// MIDI note constants
60 => int c;     72 => int C;
61 => int cs;    73 => int Cs;
62 => int d;     74 => int D;
63 => int ds;    75 => int Ds;
64 => int e;     76 => int E;
65 => int f;     77 => int F;
66 => int fs;    78 => int Fs;
67 => int g;     79 => int G;
68 => int gs;    80 => int Gs;
69 => int a;     81 => int A;
70 => int as;    82 => int As;
71 => int b;     83 => int B;

// integers 1,2,4,8 mean musical figures
float duration[9] ;
4.0 => duration[1] ; // whole
2.0 => duration[2] ; // half
1.0 => duration[4] ; // quarter
0.5 => duration[8] ; // eighth
1.5 => duration[5] ; // dotted quarter
3.0 => duration[3] ; // dotted half

dur duration[9] ;
240000::ms / ( 1 * tempo )  => duration[1]; // whole
240000::ms / ( 2 * tempo )  => duration[2]; // half
240000::ms / ( 4 * tempo )  => duration[4]; // quarter
240000::ms / ( 8 * tempo )  => duration[8]; // eighth
(duration[4] + duration[8]) => duration[5]; // dotted quarter
(duration[2] + duration[4]) => duration[3]; // dotted half

// Tune fragments. Each note is a pair of [MIDI note,duration]
[[a,4],
 [C,2],[D,4],[E,5],[F,8], [E,4], [D,2], [b,4], [g,5],[a,8],[b,4],
 [C,2],[a,4],[a,5],[gs,8],[a,4], [b,2], [gs,4],[e,2],[a,4],
 [C,2],[D,4],[E,5],[F,8], [E,4], [D,2], [b,4], [g,5],[a,8],[b,4],
 [C,5],[b,8],[a,4],[gs,5],[fs,8],[gs,4],[a,3], [a,3],
 [G,2],[G,4],[G,5],[F,8], [E,4], [D,2], [b,4], [g,5],[a,8],[b,4],
 [C,2],[a,4],[a,5],[gs,8],[a,4], [b,2], [gs,4],[e,2],[e,4],
 [G,2],[G,4],[G,5],[F,8], [E,4], [D,2], [b,4], [g,5],[a,8],[b,4],
 [C,5],[b,8],[a,4],[gs,5],[fs,8],[gs,4],[a,3], [a,3]] @=> int voice1[][];

[[0,4],
 [a,2],[b,4],[C,3],[g,3],[b,3],
 [a,3],[F,3],[E,3],[e,3],
 [a,2],[b,4],[C,3],[g,3],[b,3],
 [a,3],[e,3],[a,3],[a,3],
 [C,3],[C,3],[g,3],[b,3],
 [a,3],[F,3],[E,3],[e,3],
 [C,3],[C,3],[g,3],[b,3],
 [a,3],[e,3],[a,3],[a,3]] @=> int voice2[][];
*/

// play([s1 , s2] , [voice1 , voice2] , [0.0 , -12.0]) ;
Song greensleves ;
greensleves.setParts([hiPart , loPart]) ;
greensleves.play() ;
