// Fuga a seis voces en SuperCollider - Inspirado en Bach

(
SynthDef(\organo6, { |out=0, freq=440, amp=0.05, gate=1, pan=0|
    var sig, env;
    env = EnvGen.kr(Env.asr(0.03, 1, 0.15), gate, doneAction: 2);
    sig = Mix.ar([SinOsc.ar(freq,0,0.5), SinOsc.ar(freq*2,0,0.15), SinOsc.ar(freq*3,0,0.08), SinOsc.ar(freq*4,0,0.04)]);
    sig = sig * env * amp;
    Out.ar(out, Pan2.ar(sig, pan));
}).add;
)

~voz1 = Pbind(\instrument,\organo6,\midinote,Pseq([72,76,79,84,83,79,81,77,79,76,74,72],1),\dur,Pseq([0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,0.5,0.5,1],1),\amp,0.06,\pan,0);
~voz2 = Pbind(\instrument,\organo6,\midinote,Pseq([60,64,67,72,71,67,69,65,67,64,62,60],1),\dur,Pseq([0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,0.5,0.5,1],1),\amp,0.05,\pan,-0.3);
~voz3 = Pbind(\instrument,\organo6,\midinote,Pseq([67,71,74,79,78,74,76,72,74,71,69,67],1),\dur,Pseq([0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,0.5,0.5,1],1),\amp,0.05,\pan,0.3);
~voz4 = Pbind(\instrument,\organo6,\midinote,Pseq([48,52,55,60,59,55,57,53,55,52,50,48],1),\dur,Pseq([0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,0.5,0.5,1],1),\amp,0.06,\pan,0);
~voz5 = Pbind(\instrument,\organo6,\midinote,Pseq([64,62,60,59,57,60,62,64,65,67,69,67],1),\dur,Pseq([0.25,0.25,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,1],1),\amp,0.04,\pan,-0.6);
~voz6 = Pbind(\instrument,\organo6,\midinote,Pseq([36,36,36,36,43,43,43,43,48,48,48,48],1),\dur,Pseq([1,1,1,1,1,1,1,1,1,1,1,1],1),\amp,0.07,\pan,0.6);

~p1 = ~voz1.play; 1.5.wait;
~p2 = ~voz2.play; 1.5.wait;
~p3 = ~voz3.play; 1.5.wait;
~p4 = ~voz4.play; 1.5.wait;
~p5 = ~voz5.play; 1.5.wait;
~p6 = ~voz6.play;
