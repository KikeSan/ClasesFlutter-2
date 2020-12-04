import 'package:flutter/material.dart';
import 'package:headers/src/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier{
  Widget _currentPage = SlideshowPage();

  Widget get currentPage => this._currentPage;

  set currentPage(Widget value) {
    this._currentPage = value;
    notifyListeners();
  }
}