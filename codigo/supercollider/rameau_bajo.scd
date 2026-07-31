// Rameau: bajo fundamental y enlace de acordes
// Traité de l'harmonie, 1722

(
SynthDef(\rameau, { |out=0, freq=440, amp=0.08, gate=1|
    var sig, env;
    env = EnvGen.kr(Env.asr(0.02, 1, 0.3), gate, doneAction: 2);
    sig = Mix.ar([SinOsc.ar(freq,0,0.5), SinOsc.ar(freq*2,0,0.2), SinOsc.ar(freq*3,0,0.1)]);
    sig = sig * env * amp;
    Out.ar(out, sig!2);
}).add;

~progresion_rameau = Routine({
    var acordes = [[60,64,67],[67,71,74],[60,64,67],[60,65,69],[67,71,74],[60,64,67]];
    var duraciones = [2.0,1.5,2.0,1.5,1.5,3.0];
    acordes.do { |notas,i|
        notas.do { |midi| Synth(\rameau,[\freq,midi.midicps,\amp,0.06]) };
        duraciones[i].wait;
    };
});

~progresion_rameau.play;
)
