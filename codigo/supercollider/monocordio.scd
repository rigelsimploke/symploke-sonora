// Monocordio pitagórico en SuperCollider
(
SynthDef(\monocordio, { |out=0, freq=440, amp=0.3, pan=0|
    var sig = SinOsc.ar(freq, 0, amp) * EnvGen.kr(
        Env.perc(0.01, 1.5, 1, -4),
        doneAction: 2
    );
    Out.ar(out, Pan2.ar(sig, pan));
}).add;

Routine({
    [1, 2, 1.5, 4/3, 1.25, 1.2, 1].do { |ratio, i|
        Synth(\monocordio, [\freq, 440 * ratio]);
        (1.5).wait;
    };
}).play;
)
#+END_SRC

s.boot;