Mandolin mandolin1 => JCRev reverb => dac ;
Mandolin mandolin2 => reverb ;
0.6 => mandolin1.gain ;
0.4 => mandolin2.gain ;
0.9 => reverb.gain ;
0.2 => reverb.mix ;


SongPart hiPart ;
hiPart.setInstrument(mandolin1) ;
hiPart.setNotes(
["a4 1"   ,
 "c5 2"   , "d5 1"   , "e5 1.5" , "f5 0.5"  , "e5 1"    , "d5 2"    , "b4 1"    , "g4 1.5" , "a4 0.5" , "b4 1" ,
 "c5 2"   , "a4 1"   , "a4 1.5" , "g#4 0.5" , "a4 1"    , "b4 2"    , "g#4 1"   , "e4 2"   , "a4 1"   ,
 "c5 2"   , "d5 1"   , "e5 1.5" , "f5 0.5"  , "e5 1"    , "d5 2"    , "b4 1"    , "g4 1.5" , "a4 0.5" , "b4 1" ,
 "c5 1.5" , "b4 0.5" , "a4 1"   , "g#4 1.5" , "f#4 0.5" , "g#4 1"   , "a4 3"    , "a4 3"   ,
 "g5 2"   , "g5 1"   , "g5 1.5" , "f5 0.5"  , "e5 1"    , "d5 2"    , "b4 1"    , "g4 1.5" , "a4 0.5" , "b4 1" ,
 "c5 2"   , "a4 1"   , "a4 1.5" , "g#4 0.5" , "a4 1"    , "b4 2"    , "g#4 1"   , "e4 2"   , "e4 1"   ,
 "g5 2"   , "g5 1"   , "g5 1.5" , "f5 0.5"  , "e5 1"    , "d5 2"    , "b4 1"    , "g4 1.5" , "a4 0.5" , "b4 1" ,
 "c5 1.5" , "b4 0.5" , "a4 1"   , "g#4 1.5" , "f#4 0.5" , "g#4 1"   , "a4 3"    , "a4 3"]
) ;

SongPart loPart ;
loPart.setInstrument(mandolin2) ;
loPart.setNotes(
["rest 1" ,
 "a3 2" , "b3 1" , "c4 3" , "g3 3" , "b3 3" ,
 "a3 3" , "f4 3" , "e4 3" , "e3 3" ,
 "a3 2" , "b3 1" , "c4 3" , "g3 3" , "b3 3" ,
 "a3 3" , "e3 3" , "a3 3" , "a3 3" ,
 "c4 3" , "c4 3" , "g3 3" , "b3 3" ,
 "a3 3" , "f4 3" , "e4 3" , "e3 3" ,
 "c4 3" , "c4 3" , "g3 3" , "b3 3" ,
 "a3 3" , "e3 3" , "a3 3" , "a3 3"]
) ;

Song greensleves ;
greensleves.setTempo(160) ;
greensleves.setParts([hiPart , loPart]) ;
greensleves.play() ;
