// Laboratorio de Fourier: control de armónicos individuales
// Demostración de que el timbre es una suma de parciales

(
SynthDef(\fourier_lab, { |out=0, freq=220, amp=0.08|
    var sig;
    sig = Mix.ar(16.collect { |i|
        var n = i + 1;
        var active = NamedControl.kr(("arm_" ++ n).asSymbol, 1, 0.02);
        SinOsc.ar(freq * n, 0, 1/n) * active
    });
    sig = sig * amp;
    Out.ar(out, sig!2);
}).add;
)
