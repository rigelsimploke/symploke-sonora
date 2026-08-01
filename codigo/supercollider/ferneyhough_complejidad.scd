// Ferneyhough algorítmico: polirritmia extrema
// La partitura como campo de fuerzas

(
SynthDef(\voz_compleja, { |out=0, freq=440, amp=0.08, gate=1, pan=0|
    var sig, env;
    env = EnvGen.kr(Env.perc(0.01, 0.3, 1, -4), gate, doneAction: 2);
    sig = SinOsc.ar(freq, 0, amp) * env;
    Out.ar(out, Pan2.ar(sig, pan));
}).add;

~complejidad = Routine({
    var patrones = [
        Pbind(\instrument, \voz_compleja, \midinote, Pseq([72,74,76,77,79],inf), \dur, 0.16, \amp, 0.06, \pan, -0.8),
        Pbind(\instrument, \voz_compleja, \midinote, Pseq([60,62,64,65,67,69,71],inf), \dur, 0.114, \amp, 0.05, \pan, -0.4),
        Pbind(\instrument, \voz_compleja, \midinote, Pseq([48,52,55,60,64,67],inf), \dur, 0.333, \amp, 0.06, \pan, 0),
        Pbind(\instrument, \voz_compleja, \midinote, Pseq([67,65,64,62,60,59,57,55,53,52,50],inf), \dur, 0.145, \amp, 0.04, \pan, 0.4),
        Pbind(\instrument, \voz_compleja, \midinote, Pseq([36,38,40,41,43,45,47,48,50,52,53,55,57],inf), \dur, 0.123, \amp, 0.05, \pan, 0.8)
    ];
    patrones.do { |p| p.play };
    30.wait;
});
~complejidad.play;
)
