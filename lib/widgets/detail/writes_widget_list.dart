import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_app/provider/cSS_provider.dart';
import 'package:tmdb_movie_app/widgets/detail/writes_widget.dart';

class WritesWidgetList extends StatefulWidget {
  final int id;

  const WritesWidgetList({Key key, this.id}) : super(key: key);
  @override
  _WritesWidgetListState createState() => _WritesWidgetListState();
}

class _WritesWidgetListState extends State<WritesWidgetList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var castItems = Provider.of<CastServiceProvider>(context, listen: false);
    castItems.getCasts(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var writesItem = Provider.of<CastServiceProvider>(context);
    return writesItem.loading
        ? Container(
            width: double.infinity,
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : ListView.builder(
            itemCount: writesItem.castModel.crew.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return WritesWidget(
                writesName: writesItem.castModel.crew[index].name,
              );
            },
          );
  }
}
