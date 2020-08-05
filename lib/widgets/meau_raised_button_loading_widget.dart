import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MeauRaisedButtonLoading extends StatefulWidget {
  final String text;
  final Function onPressed;

  const MeauRaisedButtonLoading(this.text, this.onPressed,
      {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MeauRaisedButtonLoadingState(this.text, this.onPressed);
  }
}

class _MeauRaisedButtonLoadingState extends State<MeauRaisedButtonLoading> {
  final maxWidth = 45.0;
  final maxHeight = 16.0;
  
  bool _isLoading = false;
  Widget _loadingWidget;
  Text _textWidget;
  Function _onPressed;
  Key viewKey;

  _MeauRaisedButtonLoadingState(String text, Function onPressed) {
    this._textWidget = Text(text);
    this._loadingWidget = SpinKitThreeBounce(color: Colors.white, size: 12);
    this._onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        elevation: 2,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                constraints:
                    BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
                child: _isLoading ? this._loadingWidget : this._textWidget)),
        onPressed: _buttonPressed);
  }

  _buttonPressed() async {
    if (this._isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // request to firebase database database
    await this._onPressed();

    setState(() {
      _isLoading = false;
    });
  }
}
