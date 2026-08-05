s.boot;

(
SynthDef(\karplus_strong, { |out=0, freq=220, amp=0.3, decay=3, pan=0|
    var sig, delayTime, noise, feedback;
    delayTime = freq.reciprocal;
    noise = WhiteNoise.ar(amp) * EnvGen.kr(Env.perc(0.001, delayTime*2, 1, -8), doneAction:0);
    feedback = LocalIn.ar(1) + noise;
    feedback = DelayC.ar(feedback, 0.5, delayTime);
    feedback = LPF.ar(feedback, freq*6) * (1 - (1/decay));
    LocalOut.ar(feedback);
    sig = Limiter.ar(feedback, 0.8);
    Out.ar(out, Pan2.ar(sig, pan));
}).add;
)

~escala = Pbind(\instrument,\karplus_strong,\midinote,Pseq([60,62,64,67,69,72,74,76,79,81,84,86,88,91,93,96],1),\dur,0.2,\amp,0.15,\decay,4).play;