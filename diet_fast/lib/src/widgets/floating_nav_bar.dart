import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FloatingNavBar extends StatelessWidget {
  final Color activeColor;
  final Color inactiveColor;

  FloatingNavBar({
    @required this.activeColor, 
    @required this.inactiveColor
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => _FloatingNavBarModel(),
      child: Container(
        margin: EdgeInsets.only(bottom: screenSize.height*0.025),
        padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.05, vertical: screenSize.height*0.01),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 2
            )
          ]
        ),
        child: Builder(
          builder: (BuildContext context){
            Provider.of<_FloatingNavBarModel>(context, listen: false).activeColor = this.activeColor;
            Provider.of<_FloatingNavBarModel>(context, listen: false).inactiveColor = this.inactiveColor;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _IconFloatingNavBar(
                  index: 0,
                  screenSize: screenSize,
                  icon: FontAwesomeIcons.home,
                  text: 'Inicio',
                ),
                _IconFloatingNavBar(
                  index: 1,
                  screenSize: screenSize,
                  icon: FontAwesomeIcons.userAlt,
                  text: 'Mi Cuenta',
                ),
                _IconFloatingNavBar(
                  index: 2,
                  screenSize: screenSize,
                  icon: FontAwesomeIcons.trophy,
                  text: 'Mis Metas',
                ),
                _IconFloatingNavBar(
                  index: 3,
                  screenSize: screenSize,
                  icon: FontAwesomeIcons.cog,
                  text: 'Ajustes',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _IconFloatingNavBar extends StatelessWidget {
  const _IconFloatingNavBar({
    @required this.index,
    @required this.screenSize, 
    @required this.icon,
    @required this.text
  });

  final int index;
  final Size screenSize;
  final IconData icon;
  final String text;


  @override
  Widget build(BuildContext context) {
    final _navBarModel = Provider.of<_FloatingNavBarModel>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.02),
      child: InkWell(
        onTap: (){
          Provider.of<_FloatingNavBarModel>(context, listen: false).itemSelected = this.index;
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FaIcon(
              icon, 
              size: screenSize.height*0.02,
              color: _navBarModel.itemSelected == index 
                ? _navBarModel.activeColor : _navBarModel.inactiveColor  
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: screenSize.height*0.015,
                fontWeight: _navBarModel.itemSelected == index ? FontWeight.bold : FontWeight.normal,
                color: _navBarModel.itemSelected == index 
                  ? _navBarModel.activeColor : _navBarModel.inactiveColor  
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FloatingNavBarModel with ChangeNotifier{
  int _itemSelected = 0;
  Color _activeColor;
  Color _inactiveColor;

  int get itemSelected => this._itemSelected;

  set itemSelected(int index){
    this._itemSelected = index;
    notifyListeners();
  }
  
  Color get activeColor => this._activeColor;

  set activeColor(Color value){
    this._activeColor = value;    
  }
  
  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color value){
    this._inactiveColor = value;    
  }

}