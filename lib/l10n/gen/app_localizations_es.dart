// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => '¿Quién juega?';

  @override
  String get newGame => 'Nueva partida';

  @override
  String get emptySlot => 'Espacio libre';

  @override
  String get yourName => 'Tu nombre';

  @override
  String get namePlaceholder => 'Por ejemplo, Lucía';

  @override
  String get nameRequired => 'Escribe un nombre';

  @override
  String get start => 'Empezar';

  @override
  String get cancel => 'Cancelar';

  @override
  String deleteSlotTitle(String name) {
    return '¿Borrar a $name?';
  }

  @override
  String get deleteSlotBody =>
      'Se borrará todo el progreso de este jugador. No se puede deshacer.';

  @override
  String get delete => 'Borrar';

  @override
  String levelLabel(int n) {
    return 'Nivel $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pistas',
      one: '1 pista',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Toca: rellenar';

  @override
  String get tutorialDoubleTap =>
      'Doble toque: poner X (doble toque en una X: quitarla)';

  @override
  String get tutorialDrag =>
      'Mantén pulsado y desliza para marcar muchas casillas a la vez. Doble toque y desliza desde una X para borrar las X.';

  @override
  String get hint => 'Pista';

  @override
  String get noHintsTitle => 'No te quedan pistas';

  @override
  String get noHintsBody => 'Mira un anuncio corto y gana 1 pista.';

  @override
  String get noHintsBodyNoAds => 'Has usado todas tus pistas.';

  @override
  String get watchAdForHint => 'Ver anuncio: +1 pista';

  @override
  String get outOfLivesTitle => 'Sin vidas';

  @override
  String get outOfLivesBody =>
      'Mira un anuncio para ganar 1 vida más o vuelve a empezar el nivel.';

  @override
  String get outOfLivesBodyNoAds =>
      'Empieza el nivel de nuevo o vuelve a los niveles.';

  @override
  String get watchAdForLife => 'Ver anuncio: +1 vida';

  @override
  String get restart => 'Empezar de nuevo';

  @override
  String get backToLevels => 'Volver a los niveles';

  @override
  String get levelComplete => '¡Genial!';

  @override
  String nextLevel(int n) {
    return 'Siguiente: nivel $n';
  }

  @override
  String get ok => 'Vale';

  @override
  String get allDoneSoon => 'Pronto habrá niveles nuevos';

  @override
  String get adLabel => 'Anuncio';

  @override
  String get adPlaceholder => 'Aquí se mostrará un anuncio';

  @override
  String get adClose => 'Cerrar';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => '¿Cómo se juega?';

  @override
  String get rulesClues =>
      'Los números de la izquierda y de arriba indican cuántas casillas llenas hay en esa fila y columna. Si hay varios números, entre los grupos hay al menos un hueco.';

  @override
  String get rulesMistakes =>
      'Si rellenas una casilla que debe quedar vacía, pierdes 1 vida. Las X son libres: toma notas como quieras. Para rellenar una casilla con X, quita primero la X con un doble toque.';

  @override
  String get rulesScoring =>
      'Cada acierto da puntos. Acertar seguido hace crecer el multiplicador (hasta x5). Completar filas y columnas da puntos extra.';

  @override
  String levelScore(int score) {
    return '$score puntos';
  }

  @override
  String totalScore(int total) {
    return 'Total: $total';
  }

  @override
  String get rulesGoal =>
      'Encuentra todas las casillas llenas y los bloques revelarán una imagen oculta.';

  @override
  String worldLabel(int n) {
    return 'Mapa $n';
  }

  @override
  String get worldsTitle => 'Mapas';

  @override
  String get worldUnlocked => '¡Nuevo mapa desbloqueado!';

  @override
  String get worldComplete => '¡Mapa completado!';

  @override
  String nextWorld(String name) {
    return 'Siguiente mapa: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Termina este mapa para desbloquear $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name muy pronto';
  }

  @override
  String get worldLocked => 'Termina el mapa anterior';

  @override
  String get worldSoon => 'Próximamente';

  @override
  String get youAreHere => 'Estás aquí';

  @override
  String get mapStart => 'Inicio';

  @override
  String playLevel(int n) {
    return 'Jugar · Nivel $n';
  }

  @override
  String get tapToContinue => 'Toca para continuar';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Ajustes';

  @override
  String get settingsSound => 'Efectos de sonido';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageDevice => 'Idioma del dispositivo';

  @override
  String hintRow(int n) {
    return 'Fila $n';
  }

  @override
  String hintColumn(int n) {
    return 'Columna $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): los grupos y un hueco entre cada uno llenan toda la línea, así que cada casilla está clara. ¡Esta casilla está llena!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): empujes los grupos al principio o al final, esta casilla siempre queda dentro de un grupo. ¡Seguro que está llena!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): tus casillas y tus X limitan dónde caben los grupos. ¡En todas las posiciones posibles esta casilla está llena!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): ningún grupo llega a esta casilla, así que está vacía. Hemos puesto una X.';
  }

  @override
  String get hintFallback => 'Esta casilla es parte de la imagen.';

  @override
  String get tutorialSkip => 'Saltar';

  @override
  String get tutorialGotIt => 'Entendido';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'Lección $lesson/$count';
  }

  @override
  String get tutorialStart => '¡Vamos!';

  @override
  String get tutorialSkipTitle => '¿Saltar el tutorial?';

  @override
  String get tutorialSkipBody =>
      '¿Saltar solo la lección de este nivel o todo el tutorial?';

  @override
  String get tutorialSkipLevel => 'Solo este nivel';

  @override
  String get tutorialSkipAll => 'Saltar todo';

  @override
  String get tutorialWelcome =>
      '¡Hola! Cada puzle esconde un dibujo. Lee los números, llena las casillas correctas y descúbrelo.';

  @override
  String get tutorialL1Fill =>
      '[5]: esta fila tiene 5 casillas llenas. La fila mide 5, ¡así que todas están llenas! Toca una.';

  @override
  String get tutorialL1Drag =>
      '¡Genial! Ahora desliza sin levantar el dedo para llenar el resto de la fila.';

  @override
  String get tutorialL1Row =>
      'Esta fila también es [5]. Esta vez desliza de punta a punta de una vez.';

  @override
  String get tutorialL1AutoCross =>
      'Las [2] casillas de esta columna ya están, así que las demás recibieron una X solas. X significa: vacía.';

  @override
  String get tutorialL1Column =>
      'Los números de arriba son de las columnas. Esta columna es [5]: desliza de arriba abajo.';

  @override
  String get tutorialL1Count =>
      'Esta fila necesita [3] casillas. Las X están vacías, así que quedan justo 3. ¡Llénalas todas!';

  @override
  String get tutorialL1Finish =>
      '¡Termina tú la última fila y descubre el dibujo!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: dos grupos separados. 2 llenas, al menos 1 vacía y 2 llenas. 2 + 1 + 2 = 5: ¡encaja justo!';

  @override
  String get tutorialL2Cross =>
      'Así que la casilla del medio está vacía. Tócala dos veces para poner una X.';

  @override
  String get tutorialL2Drag =>
      'Una X es solo una nota; no cuesta nada. Ahora desliza por la fila: la X se salta.';

  @override
  String get tutorialL2CrossSelf =>
      'La fila de abajo también es [2 2]. Te toca: primero toca dos veces la casilla vacía para poner una X.';

  @override
  String get tutorialL2DragSelf => 'Ahora desliza para llenar la fila.';

  @override
  String get tutorialL2Mistakes =>
      'Cuidado: si llenas una casilla equivocada se vuelve una X roja y pierdes un corazón. ¿Dudas? ¡Pon una X primero!';

  @override
  String get tutorialL2Finish =>
      '¡El resto es tuyo! ¿Atascado? Cuenta cuántas casillas le faltan a una línea.';

  @override
  String get tutorialL3Overlap =>
      'Esta columna es [4] y hay sitio para 5. El bloque de 4 va arriba del todo o abajo del todo. ¡En ambos casos, las 3 del medio están llenas!';

  @override
  String get tutorialL3OverlapFill =>
      'Llena esas casillas seguras. Este truco se llama superposición: ¡el secreto de los puzles grandes!';

  @override
  String get tutorialL3OverlapSelf =>
      'Esta columna también es [4]. ¡Encuentra tú las casillas seguras!';

  @override
  String get tutorialL3OverlapRow =>
      '¿Y [3]? Pegado a la izquierda o a la derecha, la casilla del medio siempre está llena. ¡Llénala!';

  @override
  String get tutorialL3Finish =>
      '¡Genial! Usarás mucho este truco en los puzles grandes. ¡Ahora termina el dibujo!';

  @override
  String get tutorialL4Ones =>
      'Las tres filas de arriba son [1 1 1]: tres casillas sueltas con huecos entre ellas. 1 + 1 + 1 + 1 + 1 = 5: ¡encajan justo!';

  @override
  String get tutorialL4CrossDrag =>
      'Así que las tres casillas de arriba de esta columna están vacías. Toca dos veces, deja el dedo apoyado en el segundo toque y desliza hacia abajo: ¡tres X de una vez!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Te toca: dibuja X de un solo trazo en las tres casillas vacías de esta columna.';

  @override
  String get tutorialL4Erase =>
      '¿Una X equivocada? Tócala dos veces otra vez para quitarla. Si deslizas con doble toque desde una X, borras las X por las que pasas.';

  @override
  String get tutorialL4Finish => '¡Súper! Ahora completa el dibujo.';

  @override
  String get tutorialL5Sum =>
      '¡Última lección! Esta columna es [3 1]: 3 + 1 + 1 = 5, así que es segura. ¡Resuélvela tú!';

  @override
  String get tutorialL5Hint =>
      '¿Atascado? Pulsa Pista: te muestra el siguiente paso y por qué.';

  @override
  String get tutorialL5Finish =>
      '¡Ya estás listo! En las cuadrículas grandes, unas líneas gruesas separan cada 5 casillas para ayudarte a contar. ¡Termina el dibujo!';
}
