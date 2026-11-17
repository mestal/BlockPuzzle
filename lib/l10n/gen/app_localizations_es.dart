// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

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
  String get pickColor => 'Elige tu color';

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
  String get watchAdForHint => 'Ver anuncio: +1 pista';

  @override
  String get outOfLivesTitle => 'Sin vidas';

  @override
  String get outOfLivesBody =>
      'Mira un anuncio para ganar 1 vida más o vuelve a empezar el nivel.';

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
  String get tutorialL1Fill =>
      'Los números dicen cuántas casillas de esa fila están llenas. Esta fila dice 5: ¡las 5 casillas están llenas! Toca una casilla para llenarla.';

  @override
  String get tutorialL1Drag =>
      '¡Genial! Ahora mantén el dedo pulsado y desliza para llenar el resto de la fila.';

  @override
  String get tutorialL1Column =>
      'Esta columna también dice 5: desliza de arriba abajo.';

  @override
  String get tutorialL1Finish =>
      'Cuando una fila o columna está completa, sus otras casillas reciben una X solas. ¡Termina el resto del dibujo tú solo!';

  @override
  String get tutorialL2Cross =>
      '2 2 significa 2 casillas llenas, al menos un hueco y luego otras 2 casillas llenas. 2 + hueco + 2 = 5: ¡la fila es segura! Toca dos veces la casilla vacía para poner una X.';

  @override
  String get tutorialL2Drag =>
      'Las casillas con tu X se saltan al deslizar. Desliza por toda la fila para llenarla.';

  @override
  String get tutorialL2Rules =>
      'Llenar una casilla equivocada cuesta 1 vida; las X son gratis. Si te atascas, el botón Pista también explica por qué. ¡El resto es cosa tuya!';
}
