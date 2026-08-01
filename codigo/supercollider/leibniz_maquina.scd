// Máquina de Leibniz en SuperCollider (1673)
// "La música es aritmética inconsciente del alma"

(
SynthDef(\leibniz_tono, { |out=0, freq=440, amp=0.1, duracion=0.3|
    var sig, env;
    env = EnvGen.kr(Env.perc(0.01, duracion, 1, -4), doneAction: 2);
    sig = SinOsc.ar(freq, 0, amp) * env;
    Out.ar(out, sig!2);
}).add;
)

(
~leibniz_sonoro = Routine({
    var a = 15, b = 27;
    var suma = a + b;
    var resta = a - b;
    var multi = a * b;
    var div = if(b != 0) { a / b } { 0 };
    ("=== Máquina de Leibniz (1673) ===").postln;
    Synth(\leibniz_tono, [\freq, (60+suma).midicps, \amp, 0.1]); 0.6.wait;
    Synth(\leibniz_tono, [\freq, (60+resta.abs).midicps, \amp, 0.08]); 0.6.wait;
    Synth(\leibniz_tono, [\freq, (60+(multi%40)).midicps, \amp, 0.06]); 0.6.wait;
    Synth(\leibniz_tono, [\freq, (60+(div*40).asInteger).midicps, \amp, 0.05]); 0.6.wait;
    ("Leibniz: aritmética inconsciente del alma").postln;
});
~leibniz_sonoro.play;
)
