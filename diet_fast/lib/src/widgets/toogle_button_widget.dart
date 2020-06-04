import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToogleButtonList extends StatelessWidget {
  final double height;
  final List<String> opciones;
  final Function(int) onPressed;
  final Color activeColor;
  final Color activeTextColor;
  final Color inactiveTextColor;

  const ToogleButtonList({
    @required this.height, 
    @required this.opciones, 
    @required this.activeColor, 
    @required this.activeTextColor, 
    @required this.inactiveTextColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ToggleButtonsModel(),
      child: Builder(
        builder: (BuildContext context){
          Provider.of<_ToggleButtonsModel>(context).activeTextColor = this.activeTextColor;
          Provider.of<_ToggleButtonsModel>(context).activeColor = this.activeColor;
          Provider.of<_ToggleButtonsModel>(context).inactiveTextColor = this.inactiveTextColor;
          Provider.of<_ToggleButtonsModel>(context).height = this.height;

          int itemSeleccionado = Provider.of<_ToggleButtonsModel>(context).itemSeleccionado;
          return Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: height,
                child: Center(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      opciones.length, 
                      (index) => _ToogleButton(
                        index: index, 
                        text: opciones[index], 
                        onPressed: onPressed,                
                      ))
                  ),
                )
              ),
              SizedBox(height: height*0.5,),
              Text(
                '${opciones[itemSeleccionado][0].toUpperCase()}${opciones[itemSeleccionado].substring(1)}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height*0.9,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class _ToogleButton extends StatelessWidget {
  const _ToogleButton({
    @required this.index,
    @required this.text, 
    this.onPressed
  });

  final int index;
  final String text;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    final toggleModel = Provider.of<_ToggleButtonsModel>(context);
    return FlatButton(
      onPressed: (){
        Provider.of<_ToggleButtonsModel>(context, listen: false).itemSeleccionado = this.index;
        if(onPressed != null){
          onPressed(this.index);
        }
      },
      child: Text(
        text, 
        style: TextStyle(
          fontSize: toggleModel.height/2, 
          fontWeight: FontWeight.bold, 
          color: toggleModel.itemSeleccionado == index ? toggleModel.activeTextColor : toggleModel.inactiveTextColor
        ),
      ),
      color: toggleModel.itemSeleccionado == index ? toggleModel.activeColor : Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}


class _ToggleButtonsModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _activeColor;
  Color _activeTextColor;
  Color _inactiveTextColor;
  double _height;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }
  
  double get height => this._height;

  set height(double value){
    this._height = value;
  }
  
  Color get activeColor => this._activeColor;

  set activeColor(Color value){
    this._activeColor = value;
  }
  
  Color get activeTextColor => this._activeTextColor;

  set activeTextColor(Color value){
    this._activeTextColor = value;
  }
  Color get inactiveTextColor => this._inactiveTextColor;

  set inactiveTextColor(Color value){
    this._inactiveTextColor = value;
  }
  
}