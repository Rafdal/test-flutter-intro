import 'package:flutter/material.dart';


class MiPaginador extends StatefulWidget {

  final List<Widget> pages;
  final bool isScrollable;

  MiPaginador(
    this.pages,
  {
    this.isScrollable = true,
  });


  @override
  _MiPaginadorState createState() => _MiPaginadorState();
}

class _MiPaginadorState extends State<MiPaginador> {
  
  PageController _pageController;
  
  @override
  void initState() { 
    super.initState();
    _pageController = PageController(initialPage: 0); // Seteo la página inicial
  }

  @override
  void dispose() {
    _pageController.dispose(); // Libera los recursos usados por el PageController
    super.dispose(); // Este siempre va al final
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: widget.isScrollable ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
      controller: _pageController,
      /* onPageChanged: (index) {
        setState(() => _menuIndex = index);
      }, */
      children: widget.pages,
    );
  }
}