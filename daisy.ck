Mandolin mandolin  => JCRev reverb => dac ;
Mandolin mandolinA => reverb ;
Mandolin mandolinB => reverb ;
Mandolin mandolinC => reverb ;
// StifKarp stifKarpB => reverb ;
// BandedWG bandedWG    => reverb ;
0.6 => mandolin.gain ;
0.3 => mandolinA.gain ;
0.3 => mandolinB.gain ;
0.6 => mandolinC.gain ;
0.9 => reverb.gain ;
0.2 => reverb.mix ;


SongPart hiPart ;
hiPart.setInstrument(mandolin) ;
hiPart.setNotes(
[
  "e6 3"  , "c#6 3" , "a5 3"  , "e5 3"  ,
  "f#5 1" , "g#5 1" , "a5 1"  , "g#5 2" , "a5 1" , "e5 3" , "rest 3" ,
  "f#5 3" , "d6 3"  , "c#6 3" , "a5 3"  ,
  "f#5 1" , "g#5 1" , "a5 1"  , "b5 2"  , "c#6 1" , "b5 3" , "rest 2" , "c#6 1"
]) ;

SongPart midPartA ;
midPartA.setInstrument(mandolinA) ;
midPartA.setNotes(
[
  "rest 1" , "c#5 1" , "c#5 1" , "rest 1" , "c#5 1" , "c#5 1" , "rest 1" , "c#5 1" , "c#5 1" , "rest 1" , "c#5 1" , "c#5 1" ,
  "rest 1" , "f#5 1" , "f#5 1" , "rest 1" , "f#5 1" , "f#5 1" , "rest 1" , "c#5 1" , "c#5 1" , "rest 1" , "c#5 1" , "c#5 1" ,
  "rest 1" , "f#5 1" , "f#5 1" , "rest 1" , "f#5 1" , "f#5 1" , "rest 1" , "c#5 1" , "c#5 1" , "rest 1" , "c#5 1" , "c#5 1" ,
  "rest 1" , "d#5 1" , "d#5 1" , "rest 1" , "d#5 1" , "d#5 1" , "rest 1" , "g#4 1" , "g#4 1" , "g#4 1"  , "g#4 1" , "g#4 1"
]) ;

SongPart midPartB ;
midPartB.setInstrument(mandolinB) ;
midPartB.setNotes(
[
  "rest 1" , "e5 1"  , "e5 1"  , "rest 1" , "e5 1"  , "e5 1"  , "rest 1" , "e5 1" , "e5 1" , "rest 1" , "e5 1" , "e5 1" ,
  "rest 1" , "a5 1"  , "a5 1"  , "rest 1" , "a5 1"  , "a5 1"  , "rest 1" , "e5 1" , "e5 1" , "rest 1" , "e5 1" , "e5 1" ,
  "rest 1" , "a5 1"  , "a5 1"  , "rest 1" , "a5 1"  , "a5 1"  , "rest 1" , "e5 1" , "e5 1" , "rest 1" , "e5 1" , "e5 1" ,
  "rest 1" , "f#5 1" , "f#5 1" , "rest 1" , "f#5 1" , "f#5 1" , "rest 1" , "b4 1" , "b4 1" , "b4 1"   , "b4 1" , "b4 1"
]) ;

SongPart loPart ;
loPart.setInstrument(mandolinC) ;
loPart.setNotes(
[
  "a3 3" , "e3 3" , "a3 3"   , "e3 3" ,
  "d3 3" , "a3 3" , "a3 3"   , "e3 3" ,
  "d3 3" , "a3 3" , "a3 3"   , "e3 3" ,
  "b3 3" , "b3 3" , "b3 1.5" , "e3 0.5" , "e3 1" , "e3 1" , "e3 1" , "e3 1"
]) ;

Song greensleves ;
greensleves.setTempo(160) ;
greensleves.setParts([hiPart , midPartA , midPartB , loPart]) ;
greensleves.play() ;
