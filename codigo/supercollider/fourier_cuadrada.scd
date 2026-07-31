// Descomposición de Fourier en SuperCollider
// Onda cuadrada por suma de armónicos impares
// Fourier, 1822

(
SynthDef(\cuadrada_fourier, { |out=0, freq=220, n_arm=1, amp=0.15|
    var sig;
    sig = Mix.ar(
        Array.series(n_arm, 1, 2).collect { |n, i|
            SinOsc.ar(freq * n, 0, 1/n)
        }
    );
    sig = sig * (4/pi) * amp;
    Out.ar(out, sig!2);
}).add;

~fourier_demo = Routine({
    var notas = [1, 2, 3, 5, 7, 10, 15, 20, 30, 50];
    ("=== Fourier: onda cuadrada por armónicos impares ===").postln;
    notas.do { |n|
        Synth(\cuadrada_fourier, [\freq, 220, \n_arm, n]);
        2.wait;
    };
});

~fourier_demo.play;
)
