import 'package:cubit_vexana_weekend/feature/homeview/model/photo_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  INetworkManager? manager;
  setUp(() {
    const String baseUrl = 'https://jsonplaceholder.typicode.com/photos';
    manager = NetworkManager(
        isEnableLogger: true, options: BaseOptions(baseUrl: baseUrl));
  });
  test('Sample Test', () async {
    //ilk fotomodel hata veriyor bizde model  extends INetworkModel<PhotoModel> ekliyoruz
    final response = await manager?.send<PhotoModel, List<PhotoModel>>('',
        parseModel: PhotoModel(), method: RequestType.GET);

    expect(response, isNotNull);
  });
}
