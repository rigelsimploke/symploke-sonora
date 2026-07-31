// Schoenberg: serie dodecafónica sonificada
// Pierrot Lunaire, Op. 21 (1912)

(
SynthDef(\serie, { |out=0, freq=440, amp=0.1, gate=1|
    var sig, env;
    env = EnvGen.kr(Env.perc(0.01, 0.8, 1, -4), gate, doneAction: 2);
    sig = SinOsc.ar(freq, 0, amp) * env;
    Out.ar(out, sig!2);
}).add;

~serie_schoenberg = Routine({
    var p0 = [60,61,62,63,64,65,66,67,68,69,70,71];
    var inversa = p0.collect { |n| 60 - (n - 60) };
    var retrograda = p0.reverse;
    ("=== Schoenberg: serie dodecafónica ===").postln;
    p0.do { |n| Synth(\serie,[\freq,n.midicps,\amp,0.08]); 0.3.wait };
    1.wait;
    inversa.do { |n| Synth(\serie,[\freq,n.midicps,\amp,0.06]); 0.3.wait };
    1.wait;
    retrograda.do { |n| Synth(\serie,[\freq,n.midicps,\amp,0.06]); 0.3.wait };
});

~serie_schoenberg.play;
)
