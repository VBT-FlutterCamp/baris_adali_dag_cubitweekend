import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/photo_model.dart';
import '../service/photo_service.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit(this.photoService) : super(PhotoInitial()) {
    fetchListData();
  }
  IPhotoService photoService;
  List<PhotoModel>? model;
  int? listCount = 0;
  Future<void> fetchListData() async {
    emit(PhotoLoading());
    final model = await photoService.fetchPhotoDatas();
    listCount = model?.length;
    emit(PhotoComplete(model));
  }
}

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotosInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoComplete extends PhotoState {
  final List<PhotoModel>? items;

  PhotoComplete(this.items);
}

class PhotoErrorState extends PhotoState {}
