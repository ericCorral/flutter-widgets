import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:layout_app/src/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsHigh;
  final Color dotsPrimaryColor;
  final Color dotsSecondaryColor;
  final double bulletPrimary;
  final double bulletSecondary;
  Slideshow(
      {required this.slides,
      this.dotsHigh = false,
      this.dotsPrimaryColor = Colors.red,
      this.dotsSecondaryColor = Colors.grey,
      this.bulletPrimary = 12.0,
      this.bulletSecondary = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            // Set the provider contex to colored dots
            Provider.of<_SlideshowModel>(context)._dotsPriamryColor =
                this.dotsPrimaryColor;
            Provider.of<_SlideshowModel>(context)._dotsSecondaryColor =
                this.dotsSecondaryColor;

            // Set the provider contex to dots size
            Provider.of<_SlideshowModel>(context)._bulletPrimary =
                this.bulletPrimary;
            Provider.of<_SlideshowModel>(context)._bulletSecondary =
                this.bulletSecondary;

            // return the slideshow
            return Column(
              children: <Widget>[
                if (this.dotsHigh) _Dots(this.slides.length),
                Expanded(child: _Slides(this.slides)),
                if (!this.dotsHigh) _Dots(this.slides.length),
              ],
            );
          },
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  // recive la longitud de la lista de slide y  en relacion a esa longitud renderiza los dots correspondientes
  final int slidesLength;

  _Dots(this.slidesLength);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        // Generate dynamic list List.generate(length, functionGenerator)
        children: List.generate(slidesLength, (index) => _Dot(index)),

        // Create a metod that return a List of widgets
        // children: _printDots(),

        // Naive static solution print dots manualy
        //[
        // _Dot(0),
        // _Dot(1),
        // _Dot(2),
        // _Dot(3),
        // _Dot(4),
        // _Dot(5),
        // _Dot(6),
        // _Dot(7),
        // ],
      ),
    );
  }

  // Generate dots dinamicaly
  // List<Widget> _printDots() {
  //   final List<Widget> dotList = [];
  //   for (int i = 0; i < slidesLength; i++) {
  //     dotList.add(_Dot(i));
  //   }
  //   return dotList;
  // }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    // traer la pagina actual con el contexto global del Provider
    // final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    double sizeDot;
    Color colorDot;

    if (slideshowModel._currentPage >= index - 0.5 &&
        slideshowModel.currentPage < index + 0.5) {
      sizeDot = slideshowModel._bulletPrimary;
      colorDot = slideshowModel._dotsPriamryColor;
    } else {
      sizeDot = slideshowModel._bulletSecondary;
      colorDot = slideshowModel._dotsSecondaryColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: sizeDot,
      height: sizeDot,
      decoration: BoxDecoration(
        // Cambio de color del dot en el slideShow
        color: colorDot,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

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
        Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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
      // children: [
      //   _Slide('assets/svg/slide-1.svg'),
      //   _Slide('assets/svg/slide-2.svg'),
      //   _Slide('assets/svg/slide-3.svg'),
      //   _Slide('assets/svg/slide-4.svg'),
      // ],
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    ));
  }
}

// Extraccion de metodo para cargar imagen svg con el paquete Flutter_svg.dart
class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  double _bulletPrimary = 12.0;
  double _bulletSecondary = 12.0;
  Color _dotsPriamryColor = Colors.blue;
  Color _dotsSecondaryColor = Colors.grey;

  double get currentPage => this._currentPage;
  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();
  }

  double get bulletPrimary => this._bulletPrimary;
  set bulletPrimary(double size) {
    this._bulletPrimary = size;
    notifyListeners();
  }

  double get bulletSecondary => this._bulletSecondary;
  set bulletSecondary(double size) {
    this._bulletSecondary = size;
    notifyListeners();
  }

  Color get dotsPrimaryColor => this._dotsPriamryColor;
  set dotsPrimaryColor(Color color) {
    this.dotsPrimaryColor = color;
    notifyListeners();
  }

  Color get dotsSecondaryColor => this._dotsSecondaryColor;
  set dotsSecondaryColor(Color color) {
    this.dotsSecondaryColor = color;
    notifyListeners();
  }
}
