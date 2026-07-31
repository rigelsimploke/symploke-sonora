// Karplus-Strong con sustain (cuerda frotada - violonchelo)
s.freeAll; s.quit; s.boot;

(
SynthDef(\ks_comb, { |out=0, freq=220, amp=0.2, decay=3, pan=0|
    var sig, delayTime;
    delayTime = freq.reciprocal;
    sig = WhiteNoise.ar(amp) * EnvGen.kr(Env.perc(0.001, decay), doneAction: 2);
    sig = CombC.ar(sig, 0.5, delayTime, decay);
    sig = LPF.ar(sig, freq * 4 + 100);
    sig = sig * 2;
    Out.ar(out, Pan2.ar(sig, pan));
}).add;
)

~melodia = Pbind(\instrument,\ks_comb,\midinote,Pseq([48,52,55,60,64,67,72,67,64,60,55,52,48],inf),\dur,Pseq([1,0.5,0.5,1,0.5,0.5,2,0.5,0.5,1,0.5,0.5,2],inf),\amp,0.15,\decay,4).play;
