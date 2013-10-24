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

Song greensleves ;
greensleves.setTempo(160) ;
greensleves.setParts([hiPart , loPart]) ;
greensleves.play() ;
