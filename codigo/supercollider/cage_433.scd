// John Cage: 4'33'' (1952)
// No hay silencio. Siempre hay algo que suena.

(
~cage_433 = Routine({
    ("=== John Cage: 4'33'' (1952) ===").postln;
    ("Primer movimiento: 33 segundos").postln;
    33.wait;
    ("Segundo movimiento: 2:40").postln;
    160.wait;
    ("Tercer movimiento: 1:20").postln;
    80.wait;
    ("Fin de 4'33''.").postln;
});
~cage_433.play;
)
