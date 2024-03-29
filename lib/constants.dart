import 'dart:async';

import 'package:flutter/material.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;

StreamController<bool> sup_controller = StreamController<bool>.broadcast();
enum ArPath {
  temnaa_kurtka,
  orandgeva_rubashka,
  speral_rubashka,
  mm_shirt,
  scremer_rubashka,
  shkaf,
  tv,
  t_shirt,
}
final Map<String, String> namePath = {"temnaa_kurtka":"assets/glb/mm_shirt.glb",
  "orandgeva_rubashka":"assets/glb/orandgeva_rubashka.glb","scremer_rubashka":"assets/glb/scremer_rubashka.glb",
  "shkaf":"assets/glb/shkaf.glb","speral_rubashka":"assets/glb/speral_rubashka.glb",
  "t_shirt":"assets/glb/t_shirt.glb","temnaa_kurtka":"assets/glb/temnaa_kurtka.glb",
  "tv":"assets/glb/tv.glb",};

