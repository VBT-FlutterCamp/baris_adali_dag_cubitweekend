import 'package:flutter/material.dart';

import '../../homeview/model/photo_model.dart';

class PhotoCard extends StatelessWidget {
  final PhotoModel? model;

  const PhotoCard({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _elevationCard = 10;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Card(
        elevation: _elevationCard,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              model?.title ?? '',
              textAlign: TextAlign.center,
            ),
          ),
          Image(
            fit: BoxFit.scaleDown,
            image: NetworkImage(model?.thumbnailUrl ?? ''),
            height: MediaQuery.of(context).size.width * 0.3,
            width: 150,
          ),
        ]),
        // child: ListTile(
        //   leading: Text(model?.id.toString() ?? ''),
        //   title: Text(model?.body ?? ''),
        //   subtitle: Text(model?.email ?? ''),
      ),
    );
  }
}
