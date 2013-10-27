SongPart songParts[4] ;

JCRev reverb         => dac ;
BandedWG block       => reverb ;
Moog rhythem5thsKeys => reverb ;
Moog rhythem3rdsKeys => reverb ;
VoicForm bassVox     => reverb ;
0.6 => reverb.gain ;
0.1 => reverb.mix ;
6.0 => block.gain ;
0.4 => rhythem5thsKeys.gain ;
0.4 => rhythem3rdsKeys.gain ;
0.5 => bassVox.gain ;


/* Notes */

[
  "e6  3" , "c#6 3" , "a5  3" , "e5  3" ,
  "f#5 1" , "g#5 1" , "a5  1" , "g#5 2" , "a5  1" , "e5 3" , "rst 3" ,
  "f#5 3" , "e6  3" , "c#6 3" , "a5  3" ,
  "f#5 1" , "g#5 1" , "a5  1" , "b5  2" , "c#6 1" , "b5 3" , "rst 2" , "c#6 1" ,
  "d6  1" , "c#6 1" , "b5  1" , "e6  2" , "c#6 1" , "b5 1" , "a5  3" , "rst 1" , "c#6 1" ,
  "c#6 2" , "e5  1" , "f#5 2" , "a5  1" , "f#5 1" , "e5 3" , "rst 1" , "e5  1" ,
  "f#5 2" , "a5  1" , "e5  2" , "e5  1" , "f#5 2" , "a5 1" , "e5  1" , "a5  1" , "b5  1"  ,
  "c#6 1" , "b5  1" , "a5  1" , "b5  2" , "g#5 1" , "a5 3"
] @=> string melodyNotesV1[] ;
[
  "d6  0.125" , "f#5 1.875" , "e6 0.125" , "g#5 0.375" , "a5 0.5"                , "c#6 0.175" , "e5  1.875" , "e5  1" , // this line 2 bars
  "f#6 0.125" , "f#5 1.875" , "e6 0.125" , "a5  0.375" , "d6 0.125" , "b5 0.375" , "c#6 1"     , "b5  1"     , "a5  1" , // continues 2 bars
  "c#6 1"     , "b5  1"     , "a5 1"                                             , "g#5 2"                   , "b5  1" , "a5 2" , "e6 1" , "a6 3"
] @=> string melodyNotesV2[] ;
[
  "rst 1" , "e5  1" , "e5  1" , "rst 1" , "e5  1" , "e5  1" , "rst 1"   , "e5  1"   , "e5 1"  , "rst 1" , "e5 1" , "e5 1" ,
  "rst 1" , "a5  1" , "a5  1" , "rst 1" , "a5  1" , "a5  1" , "rst 1"   , "e5  1"   , "e5 1"  , "rst 1" , "e5 1" , "e5 1" ,
  "rst 1" , "a5  1" , "a5  1" , "rst 1" , "a5  1" , "a5  1" , "rst 1"   , "a5  1"   , "a5 1"  , "rst 1" , "a5 1" , "e5 1" ,
  "rst 1" , "f#5 1" , "f#5 1" , "rst 1" , "f#5 1" , "f#5 1" , "rst 1"   , "b4  1"   , "b4 1"  , "rst 1" , "b4 1" , "b4 1" ,
  "rst 1" , "b4  1" , "b4  1" , "rst 1" , "b4  1" , "b4  1" , "rst 1"   , "e5  1"   , "e5 1"  , "rst 1" , "e5 1" , "e5 1" ,
  "rst 1" , "a5  1" , "a5  1" , "rst 1" , "a5  1" , "a5  1" , "rst 1"   , "e5  1"   , "e5 1"  , "rst 1" , "e5 1" , "e5 1" ,
  "rst 2" , "a5  1" , "e5  1" , "rst 4" , "a5  1" , "e5  1" , "rst 1"   , "e5  1"   ,
  "rst 1" , "e5  1" , "e5  1" , "rst 1" , "b5  1" , "b5  1" , "rst 1.5" , "e5  0.5" , "e5 1"  , "e5 1"
] @=> string rhythemNotes5thsV1[] ;
[
  "a5  1" , "rst 1" , "a5 1" , "e5 1" , "rst 2" , "a5  1" , "rst 1"   , "f#5 1"  , "e5  1"    , "d5 1"    , "c#5 1" ,
  "g#5 1" , "f#5 1" , "e5 1" , "d5 1" , "c#5 1" , "b4  1" , "c#5 1.5" , "a5 0.5" , "c#6 0.25" , "e6 0.25" , "a6  1"
] @=> string rhythemNotes5thsV2[] ;
[
  "rst 1" , "c#5 1" , "c#5 1" , "rst 1" , "c#5 1" , "c#5 1" , "rst 1"   , "c#5 1"   , "c#5 1" , "rst 1" , "c#5 1" , "c#5 1" ,
  "rst 1" , "f#5 1" , "f#5 1" , "rst 1" , "f#5 1" , "f#5 1" , "rst 1"   , "c#5 1"   , "c#5 1" , "rst 1" , "c#5 1" , "c#5 1" ,
  "rst 1" , "f#5 1" , "f#5 1" , "rst 1" , "f#5 1" , "f#5 1" , "rst 1"   , "c#5 1"   , "c#5 1" , "rst 1" , "c#5 1" , "c#5 1" ,
  "rst 1" , "d#5 1" , "d#5 1" , "rst 1" , "d#5 1" , "d#5 1" , "rst 1"   , "g#4 1"   , "g#4 1" , "rst 1" , "g#4 1" , "g#4 1" ,
  "rst 1" , "g#4 1" , "g#4 1" , "rst 1" , "g#4 1" , "g#4 1" , "rst 1"   , "c#5 1"   , "c#5 1" , "rst 1" , "c#5 1" , "c#5 1" ,
  "rst 1" , "f#5 1" , "f#5 1" , "rst 1" , "f#5 1" , "f#5 1" , "rst 1"   , "c#5 1"   , "c#5 1" , "rst 1" , "c#5 1" , "c#5 1" ,
  "rst 2" , "f#5 1" , "c#5 1" , "rst 4" , "f#5 1" , "c#5 1" , "rst 1"   , "c#5 1"   ,
  "rst 1" , "c#5 1" , "c#5 1" , "rst 1" , "g#5 1" , "g#5 1" , "rst 1.5" , "c#5 0.5" , "c#5 1" , "c#5 1"
] @=> string rhythemNotes3rdsV1[] ;
[
  "f#5 1" , "rst 1" , "f#5 1" , "c#5 1" , "rst 2" , "d5  1" , "rst 1"   , "b4  1"   , "c#5 1"   , "b4 1" , "a4  1" ,
  "a4  1" , "b4  1" , "c#5 1" , "b4  1" , "a4  1" , "g#4 1" , "a4  1.5" , "c#5 0.5" , "e5  0.5" , "a5 1"
] @=> string rhythemNotes3rdsV2[] ;
[
  "a3 3" , "e3  3" , "a3 3" , "e3  3" ,
  "d3 3" , "a3  3" , "a3 3" , "e3  3" ,
  "d3 3" , "a3  3" , "a3 3" , "e3  3" ,
  "b3 3" , "f#3 3" , "e3 3" , "b3  3" ,
  "e3 3" , "b3  3" , "a3 3" , "e3  3" ,
  "d3 3" , "a3  3" , "a3 3" , "e3  3" ,
  "d4 1" , "rst 1" , "d4 1" , "a3  1" , "rst 2" , "d4 1" , "rst 1" , "d4 1" , "a3 0.5" , "rst 0.5" , "b2 0.25" , "c3 0.25" , "c#3 0.5" , "e3 0.5" , "f#3 0.5" ,
  "a3 3" , "e3  3" , "a3 2" , "e3  1" , "a2  3"
] @=> string bassNotesV1[] ;
[
  "a3 3"  , "e3  3" , "c#3 3"   , "a2 3" ,
  "f#3 3" , "b3  3" , "e3  3"   , "f3 3" ,
  "f#3 3" , "d3  3" , "c#3 3"   , "c3 3" ,
  "b3 3"  , "f#3 3" , "b3  1.5" , "e3  0.5" , "e3 1"    , "e3 1"  , "e3 1" , "e3 1" ,
  "e3 2"  , "e3  1" , "b3  2"   , "b3  1"   , "a3 3"    , "a2 3"  ,
  "d3 3"  , "a3  3" , "a3  3"   , "e3  3"   ,
  "d4 1"  , "c#4 1" , "b3  1"   , "a3  3"   , "d4  1"   , "c#4 1" , "b3 1" , "c#4 1" , "b3 1" , "a3 1" ,
  "e3 3"  , "b3  2" , "c#4 1"   , "a3  0.5" , "b3  0.5" , "c#4 1" , "e4 1" , "a4  1" , "a2 1"
] @=> string bassNotesV2[] ;


/* Verse 1 */

Bandedwg melodyPart ;
melodyPart.setInstrument(block) ;
melodyPart.setTempo(160) ;
melodyPart.setNotes(melodyNotesV1) ;
melodyPart @=> songParts[0] ;

Mooog rhythemPart3 ;
rhythemPart3.setInstrument(rhythem3rdsKeys) ;
rhythemPart3.setTempo(160) ;
rhythemPart3.setNotes(rhythemNotes3rdsV1) ;
rhythemPart3 @=> songParts[1] ;

Mooog rhythemPart5 ;
rhythemPart5.setInstrument(rhythem5thsKeys) ;
rhythemPart5.setTempo(160) ;
rhythemPart5.setNotes(rhythemNotes5thsV1) ;
rhythemPart5 @=> songParts[2] ;

Voicform bassPart ;
bassPart.setInstrument(bassVox) ;
bassPart.setTempo(160) ;
bassPart.setNotes(bassNotesV1) ;
bassPart @=> songParts[3] ;

Song daisy ;
daisy.playParts(songParts) ;


/* Verse 2 */

melodyPart.setSomeNotes(melodyNotesV1 , 0 , 40) ;
melodyPart.setNote("b5  2" , 7) ;
melodyPart.setNote("g#5 1" , 8) ;
melodyPart.setNote("d6  3" , 12) ;
melodyPart.setNote("d6  3" , 14) ;
melodyPart.setNote("d#6 1" , 19) ;
melodyPart.setNote("e6  3" , 20) ;
melodyPart.setNote("b5  1" , 31) ;
melodyPart.addNotes(melodyNotesV2) ;

rhythemPart5.setSomeNotes(rhythemNotes5thsV1 , 0 , 72) ;
rhythemPart5.setNote("b4  1" , 10) ;
rhythemPart5.setNote("b4  1" , 11) ;
rhythemPart5.setNote("c#5 1" , 22) ;
rhythemPart5.setNote("c#5 1" , 23) ;
rhythemPart5.setNote("d5  1" , 16) ;
rhythemPart5.setNote("d5  1" , 17) ;
rhythemPart5.setNote("a5  1" , 34) ;
rhythemPart5.setNote("a5  1" , 35) ;
rhythemPart5.setNote("a5  1" , 41) ;
rhythemPart5.setNote("a5  1" , 42) ;
rhythemPart5.setNote("g#5 1" , 43) ;
rhythemPart5.setNote("b4  1" , 45) ;
rhythemPart5.addNotes(rhythemNotes5thsV2) ;

rhythemPart3.setSomeNotes(rhythemNotes3rdsV1 , 0 , 72) ;
rhythemPart3.setNote("g5  1" , 10) ;
rhythemPart3.setNote("g5  1" , 11) ;
rhythemPart3.setNote("a5  1" , 22) ;
rhythemPart3.setNote("a5  1" , 23) ;
rhythemPart5.setNote("b5  1" , 29) ;
rhythemPart5.setNote("c#6 1" , 30) ;
rhythemPart5.setNote("a5  1" , 31) ;
rhythemPart3.setNote("e5  1" , 34) ;
rhythemPart3.setNote("e5  1" , 35) ;
rhythemPart3.setNote("g#4 1" , 43) ;
rhythemPart3.setNote("g#4 1" , 45) ;
rhythemPart3.setNote("b4  1" , 53) ;
rhythemPart3.setNote("b4  1" , 54) ;
rhythemPart3.setNote("a4  1" , 55) ;
rhythemPart3.setNote("a4  1" , 56) ;
rhythemPart3.setNote("a5  1" , 64) ;
rhythemPart3.setNote("b5  1" , 65) ;
rhythemPart3.setNote("c#6 1" , 66) ;

rhythemPart3.addNotes(rhythemNotes3rdsV2) ;

bassPart.setNotes(bassNotesV2) ;

daisy.playParts(songParts) ;
