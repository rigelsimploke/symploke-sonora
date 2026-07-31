// Música estocástica inspirada en Xenakis
// Control estadístico de la materia sonora

(
SynthDef(\grano_xenakis, { |out=0, freq=440, amp=0.1, pan=0, duracion=0.1|
    var sig, env;
    env = EnvGen.kr(Env.perc(0.01, duracion, 1, -4), doneAction: 2);
    sig = SinOsc.ar(freq, 0, amp) * env;
    Out.ar(out, Pan2.ar(sig, pan));
}).add;

~nube_estocastica = Routine({
    var densidad = 20;
    var centro_freq = 440;
    var dispersion = 200;
    loop {
        var freq = centro_freq + (dispersion * rrand(-1.0, 1.0)).gauss(0.5);
        var amp = exprand(0.02, 0.08);
        var pan = rrand(-0.8, 0.8);
        var dur = 0.15 * rrand(0.5, 2.0);
        Synth(\grano_xenakis, [\freq, freq.max(50).min(2000), \amp, amp, \pan, pan, \duracion, dur]);
        (1.0 / densidad).wait;
    };
});

~nube_estocastica.play;
)
