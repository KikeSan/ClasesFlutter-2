import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/pages/emergency_page.dart';
import 'package:headers/src/pages/graficas_circulares_page.dart';
import 'package:headers/src/pages/headers_page.dart';
import 'package:headers/src/pages/pinterest_page.dart';
import 'package:headers/src/pages/slideshow_page.dart';
import 'package:headers/src/pages/sliver_list_page.dart';
import 'package:headers/src/retos/cuadrado_animado_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow',SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia',EmergencyPage()),
  _Route(FontAwesomeIcons.slideshare, 'Encabezados',HeadersPage()),
  _Route(FontAwesomeIcons.slideshare, 'Cuadro animado',CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.slideshare, 'Barra Progreso',GraficasCircularesPage()),
  _Route(FontAwesomeIcons.slideshare, 'Pinterest',PinterestPage()),
  _Route(FontAwesomeIcons.slideshare, 'Slivers',SliverListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}