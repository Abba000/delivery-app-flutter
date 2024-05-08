import 'package:flutter/material.dart';
//colors
import 'package:flutter_application_test/src/colors/colors.dart';
//commons widgets
import 'package:flutter_application_test/src/features/presentation/commons_widgets/Headers/header_text_button.dart';

class ListTileCheck extends StatefulWidget {
  final String texto;
  final bool isActive;
  final Function()? func;

  const ListTileCheck(
      {Key? key,
      required this.texto,
      required this.isActive,
      required this.func})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListTileCheckState createState() => _ListTileCheckState();
}

class _ListTileCheckState extends State<ListTileCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listTiles(
            context: context,
            texto: widget.texto,
            isActive: widget.isActive,
            func: widget.func)
      ],
    );
  }
}

Widget listTiles(
    {required BuildContext context,
    texto = String,
    isActive = bool,
    Function()? func}) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      onTap: func,
      title: createText(
          texto: texto,
          color: isActive ? naranja : Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 17),
      trailing: isActive
          ? Icon(
              Icons.check,
              color: isActive ? naranja : gris,
            )
          : const Text(''),
    ),
  );
}
