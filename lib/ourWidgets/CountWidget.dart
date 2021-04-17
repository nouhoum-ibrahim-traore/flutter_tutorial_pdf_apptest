import 'package:flutter/material.dart';
import 'package:flutter_tutorial_pdf_app/DataHandlerStateManagement/AppData.dart';
import 'package:provider/provider.dart';

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('${context.watch<Counter>().path}');

    /* Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
          '${context.watch<Counter>().count}',
          key: const Key('counterState'),
          style: Theme.of(context).textTheme.headline4);*/
  }
}
