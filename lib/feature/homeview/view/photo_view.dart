import 'package:cubit_vexana_weekend/feature/homeview/modelview/photo_model_view.dart';
import 'package:cubit_vexana_weekend/feature/homeview/service/photo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extension/string_contants.dart';
import '../../../core/network/network_service.dart';
import '../../product/widget/card_photo.dart';

class PhotoView extends StatelessWidget {
  PhotoView({Key? key}) : super(key: key);
  StringConstants strings = StringConstants.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PhotoCubit(PhotoService(NetworkService.instance.networkManager)),
      child: BlocConsumer<PhotoCubit, PhotoState>(
        listener: (context, state) {
          if (state is PhotoErrorState) {
            showModalBottomSheet(
                context: context, builder: (context) => Text(strings.erortext));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(strings.appbarTitle),
            ),
            body: buildBody(state, context),
          );
        },
      ),
    );
  }

  Widget buildBody(PhotoState state, BuildContext context) {
    if (state is PhotoLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is PhotoComplete) {
      return _photoGridView(context, state);
    } else {
      return Text(strings.erortext);
    }
  }

  Column _photoGridView(BuildContext context, PhotoComplete state) {
    return Column(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.03),
        ),
        Text(
          ' Resim Sayısı ->${context.watch<PhotoCubit>().listCount.toString()}',
          style: context.textTheme.headline5,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: state.items?.length,
            itemBuilder: (BuildContext context, int index) {
              return PhotoCard(model: state.items?[index]);
            },
          ),
        ),
      ],
    );
  }
}
