import 'package:vexana/vexana.dart';

import '../../../core/extension/network_path.dart';
import '../model/photo_model.dart';

abstract class IPhotoService {
  final INetworkManager manager;

  IPhotoService(this.manager);

  Future<List<PhotoModel>?> fetchPhotoDatas();
}

class PhotoService extends IPhotoService {
  PhotoService(INetworkManager manager) : super(manager);

  @override
  Future<List<PhotoModel>?> fetchPhotoDatas() async {
    final response = await manager.send<PhotoModel, List<PhotoModel>?>(
        NetworkPath.comment.rawValue(),
        parseModel: PhotoModel(),
        method: RequestType.GET);

    return response.data ?? [];
  }
}
