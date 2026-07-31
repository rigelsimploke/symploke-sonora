// Bach algorítmico: fuga a dos voces en SuperCollider

(
SynthDef(\organo, { |out=0, freq=440, amp=0.1, gate=1|
    var sig, env;
    env = EnvGen.kr(Env.asr(0.02, 1, 0.1), gate, doneAction: 2);
    sig = Mix.ar([SinOsc.ar(freq, 0, 0.6), SinOsc.ar(freq*2, 0, 0.2), SinOsc.ar(freq*3, 0, 0.1)]);
    sig = sig * env * amp;
    Out.ar(out, sig!2);
}).add;
)

~sujeto = Pbind(\instrument, \organo, \midinote, Pseq([60,64,67,72,71,67,69,65,67,64,62,60,67,65,64,62,60],1), \dur, Pseq([0.25,0.25,0.25,0.5,0.25,0.25,0.25,0.25,0.5,0.25,0.25,0.5,0.25,0.25,0.25,0.25,0.5],1), \amp, 0.12);
~contrasujeto = Pbind(\instrument, \organo, \midinote, Pseq([48,52,55,60,59,55,57,53,55,52,50,48,55,53,52,50,48],1), \dur, Pseq([0.25,0.25,0.25,0.5,0.25,0.25,0.25,0.25,0.5,0.25,0.25,0.5,0.25,0.25,0.25,0.25,0.5],1), \amp, 0.08);

~voz1 = ~sujeto.play;
2.wait;
~voz2 = ~contrasujeto.play;
