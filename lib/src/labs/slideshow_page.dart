import 'package:flutter/material.dart';

// Paquete para configurar listener de contexto para comunicacion entre componentes
import 'package:provider/provider.dart';
// Paquete para cargar imagenes svg
import 'package:flutter_svg/flutter_svg.dart';

import 'package:layout_app/src/models/slider_model.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Activar contexto global con Provider
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
          _Dot(3),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    // traer la pagina actual con el contexto global del Provider
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
          // Cambio de color del dot en el slideShow
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? Colors.red
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      // print('pagina actual: ${pageViewController.page}');
      // Actualizar el provider
      setState(() {
        Provider.of<SliderModel>(context, listen: false).currentPage =
            pageViewController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        // Creacion del Slider con el widget PageView
        child: PageView(
      controller: pageViewController,
      children: [
        _Slide('assets/svg/slide-1.svg'),
        _Slide('assets/svg/slide-2.svg'),
        _Slide('assets/svg/slide-3.svg'),
        _Slide('assets/svg/slide-4.svg'),
      ],
    ));
  }
}

// Extraccion de metodo para cargar imagen svg con el paquete Flutter_svg.dart
class _Slide extends StatelessWidget {
  final String svg;

  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
