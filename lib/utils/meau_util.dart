import 'package:firebase_auth/firebase_auth.dart';

///
/// Pacote destinado para componentes que possam ser reutilizados.
///
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meau_app/utils/meau_cores.dart';
import 'package:meau_app/view/cadastro_animal/cadastro_animal_screen.dart';
import 'package:meau_app/widgets/custom_expansion_tile.dart';
import 'package:meau_app/widgets/meau_raised_button.dart';
import 'meau_temas.dart';

class Util  {


  @override
  Widget build(BuildContext context) {
  }

  static Drawer createMeauDrawer(BuildContext context) {


    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              margin: EdgeInsets.zero,
              height: 160.0,
              child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 40.0, left: 16.0),
                          height: 64.0,
                          width: 64.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'lib/assets/images/profile.png')))),
                    ],
                  ),
                  decoration: BoxDecoration(color: Cores.azulForte))),
          createMenuDrawerOption("Keanu Reeves", Cores.azulForte, [
            createMenuDrawerItem("Meu Perfil", onPressed: () => Navigator.of(context).pushNamed("/perfilPessoal")),
            createMenuDrawerItem("Meus pets"),
            createMenuDrawerItem("Favoritos"),
            createMenuDrawerItem("Chat")
          ]),
          createMenuDrawerOption(
              "Atalhos",
              Cores.amareloFraco,
              [
                createMenuDrawerItem("Cadastrar um pet", onPressed: () => Navigator.of(context).pushNamed("/cadastroAnimal")),
                createMenuDrawerItem("Adotar um pet", onPressed: () => Navigator.of(context).pushNamed("/listaAnimais")),
                createMenuDrawerItem("Ajudar um pet")
              ],
              leadingIcon: Icon(FontAwesomeIcons.paw)),
          createMenuDrawerOption(
              "Informações",
              Cores.azulClaro,
              [
                createMenuDrawerItem("Dicas"),
                createMenuDrawerItem("Eventos"),
                createMenuDrawerItem("Lesgilação"),
                createMenuDrawerItem("Termo de adoção")
              ],
              leadingIcon: Icon(Icons.info)),
          createMenuDrawerOption("Configurações", Cores.cinzaFracoMenu, [
            createMenuDrawerItem("Sair", onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed("/login");
            }),
            createMenuDrawerItem("Privacidade", onPressed: () => Navigator.of(context).pushNamed("/privacidadeScreen"),),
          ]),
        ],
      ),
    );
  }

  static Container createMenuDrawerOption(
      String title, Color headerBackgroundColor, List<Widget> body,
      {Widget leadingIcon, bool initiallyExpanded: true}) {
    List<Widget> widgetSeparado = List();

    for (int i = 0; i < body.length; ++i) {
      widgetSeparado.add(Divider());
      widgetSeparado.add(body[i]);
    }

    return Container(
        margin: EdgeInsets.zero,
        child: CustomExpansionTile(
          initiallyExpanded: initiallyExpanded,
          leading: leadingIcon,
          headerBackgroundColor: headerBackgroundColor,
          title: Text(
            title,
            style: TextStyle(color: Cores.pretoForte),
          ),
          children: widgetSeparado,
        ));
  }

  static Widget createMenuDrawerItem(String text, {onPressed}) {
    return GestureDetector(
      onTap: () async {
        await onPressed();
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
            child: Text(
              text,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  color: Cores.pretoForte),
            ),
          ),
        ],
      ),
    );
  }

  static RaisedButton createRaisedButton(String text, Function onPressed,
      {double padding: 40.0}) {
    return RaisedButton(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 12.0, color: Cores.pretoForte),
        ),
      ),
      onPressed: onPressed,
    );
  }

  static MeauRaisedButton createStatefulRaisedButton(
      String text, Function onPressed, MenuAnimalType meauAnimalType,
      {double padding: 40.0, bool initialState: false}) {
    return MeauRaisedButton(text, onPressed, meauAnimalType,
        padding: padding, initialState: initialState);
  }

  static RaisedButton createCustomRaisedButton(
      String text, Function onPressed, Color color,
      {double padding: 40.0,
      Color disabledColor: Cores.cinzaFraco,
      Color fontColor: Cores.branco,
      IconData icon: Icons.face,
      Color iconColor: Cores.branco,
      double containerWidth: 230}) {
    return RaisedButton(
      elevation: 2,
      color: color,
      disabledColor: disabledColor,
      child: Container(
        constraints: BoxConstraints(maxWidth: containerWidth),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: "Roboto", fontSize: 12.0, color: fontColor),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }

// TODO: Tem outros que usam o ícone de busca?
  static AppBar createAppBar(String texto) {
    return AppBar(
      automaticallyImplyLeading: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          iconSize: 24.0,
          onPressed: () {},
        )
      ],
      title: Text(
        texto,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  /// Gera um widget de texto com o espaçamento adequado.
  static Widget createFieldLabel(String texto,
      {double fontSize: 12.0,
      FontWeight fontWeight: FontWeight.w400,
      Color textColor: Cores.amareloEscuro,
      double top: 8.0,
      double bottom: 8.0}) {
    return Container(
      child: Text(texto,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontFamily: "Roboto",
            fontWeight: fontWeight,
          )),
      margin: EdgeInsets.only(left: 24.0, top: top, bottom: bottom),
    );
  }

  static Widget createTextFormField(String hintText,
      {double top: 8.0,
      double bottom: 8.0,
      TextInputType textInputType,
      bool obscureText: false,
      void Function(String) onSaved,
      String Function(String) validator,
      TextEditingController controller}) {
    return Container(
        child: TextFormField(
          controller: controller,
          onSaved: onSaved,
          validator: validator,
          keyboardType: textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(hintText: hintText),
        ),
        margin:
            EdgeInsets.only(left: 24.0, right: 24.0, top: top, bottom: bottom));
  }

  static Widget createFlatButton(
      {double width: 400.0,
      double height: 160.0,
      String text: "adicionar fotos",
      Function onPressed,
      ImageProvider imagem}) {
    return Center(
        child: Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        color: imagem == null ? Cores.cinzaFraco : null,
        onPressed: onPressed,
        child: Container(
          margin: EdgeInsets.only(top: 44.0, bottom: 44.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.control_point,
                size: 24.0,
                color: Cores.pretoFraco,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 14.0, color: Cores.pretoFraco),
              )
            ],
          ),
        ),
      ),
      margin: EdgeInsets.only(
        left: 24.0,
        right: 24.0,
      ),
      width: width,
      height: height,
      decoration: _createBoxDecoration(imagem),
    ));
  }

  static BoxDecoration _createBoxDecoration(ImageProvider imagem) {
    return imagem == null
        ? BoxDecoration(borderRadius: BorderRadius.circular(6.0), boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(1.0, 4.0),
                blurRadius: 2.0,
                spreadRadius: 1.5)
          ])
        : BoxDecoration(
            image: DecorationImage(image: imagem, fit: BoxFit.contain),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(1.0, 4.0),
                    blurRadius: 2.0,
                    spreadRadius: 1.5)
              ]);
  }

  static Widget createNRadiosButtonsRow(String groupValue,
      List<String> radioButtonValueLabel, Function(String) callback) {
    List<Widget> listOfRows = List();

    for (int i = 0; i < radioButtonValueLabel.length; i = i + 2) {
      listOfRows.add(Row(
        children: <Widget>[
          Radio(
              activeColor: Cores.pretoForte,
              groupValue: groupValue,
              value: radioButtonValueLabel[i],
              onChanged: callback),
          Text(radioButtonValueLabel[i + 1])
        ],
      ));
    }

    return Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(children: listOfRows));
  }

  static Widget createNCheckBoxColumn(
      List listaCheckBoxEntidade,
      List checkBoxValueLabel,
      bool Function(dynamic, List) isPresent,
      void Function(bool, dynamic, List) onChange) {
    List<Widget> listOfRows = List();

    for (int i = 0; i < checkBoxValueLabel.length; i = i + 2) {
      listOfRows.add(Row(
        children: <Widget>[
          Checkbox(
            activeColor: Cores.pretoForte,
            value: isPresent(checkBoxValueLabel[i], listaCheckBoxEntidade),
            onChanged: onChange == null
                ? null
                : (v) =>
                    onChange(v, checkBoxValueLabel[i], listaCheckBoxEntidade),
          ),
          Text(checkBoxValueLabel[i + 1])
        ],
      ));
    }

    return Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(children: listOfRows));
  }

  /// checkBoxConfig {label1, label2, ...}
  /// callbacks {onChanged1, onChanged2, onChanged3, ...}
  static Widget createNCheckBoxRow(
      List listaCheckBoxEntidade,
      List checkBoxValueLabel,
      bool Function(dynamic, List) isPresent,
      void Function(bool, dynamic, List) onChange) {
    List<Widget> widgets = List();

    for (int i = 0; i < checkBoxValueLabel.length; i = i + 2) {
      widgets.add(Checkbox(
          activeColor: Cores.pretoForte,
          value: isPresent(checkBoxValueLabel[i], listaCheckBoxEntidade),
          onChanged: (v) =>
              onChange(v, checkBoxValueLabel[i], listaCheckBoxEntidade)));
      widgets.add(Text(checkBoxValueLabel[i + 1]));
    }

    return Container(
        margin: EdgeInsets.only(left: 10.0), child: Row(children: widgets));
  }

  static MaterialApp createDefaultMaterialApp(
      BuildContext context, String appBarTitle, Widget body,
      {bool isBlueTheme: false}) {
    BuildContext context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MeauTheme.getMeauThemeData(isBlueTheme: isBlueTheme),
      title: "Meau App",
      home: Scaffold(
          appBar: Util.createAppBar(appBarTitle),
          drawer: Util.createMeauDrawer(context),
          body: body),
    );
  }

  static Widget createMeauText(
    String text, {
    FontWeight fontWeight: FontWeight.w400,
    String fontFamily: "Roboto",
    double fontSize: 12,
    Color textColor: Cores.pretoForte,
    double top: 5,
    double bottom: 5,
    double left: 5,
    double right: 5,
  }) {
    return Container(
        margin: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: textColor),
        ));
  }

  static Widget createMeauCard(
      String title,
      Function onPressed,
      ImageProvider imagem,
      String sexo,
      String idade,
      String porte,
      String endereco) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Card(
          elevation: 4,
          // color: Colors.red,
          child: Column(
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.centerStart,
                height: 32.0,
                padding: EdgeInsets.only(left: 16),
                color: Cores.amareloFraco,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          color: Cores.pretoForte),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          padding: EdgeInsets.only(bottom: 2),
                          onPressed: onPressed,
                          alignment: Alignment.center,
                          iconSize: 24,
                          tooltip: "Favoritar",
                          icon: Icon(FontAwesomeIcons.heart),
                          color: Cores.pretoForte,
                        ))
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image(
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                        height: 183.0,
                        image: imagem),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Util.createMeauText(sexo),
                    Util.createMeauText(idade),
                    Util.createMeauText(porte)
                  ]),
              Util.createMeauText(endereco),
            ],
          )),
    );
  }
}
