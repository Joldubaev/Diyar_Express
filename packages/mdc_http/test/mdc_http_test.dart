import 'package:mdc_http/mdc_http.dart';
import 'package:test/test.dart';

import 'test_model.dart';

void main() {
  late MdcHttp mdcHttp;

  const getListUrl = 'https://eldar2021.github.io/learn_world/data/cm.json';
  const getUrl = 'https://eldar2021.github.io/encointer/test_data.json';
  const emptyList = 'https://eldar2021.github.io/encointer/test/empty_list.json';

  setUp(() {
    mdcHttp = MdcHttp();
  });

  group('MdcHttp `get`, `getType`, `getListType`', () {
    test('Get', () async {
      Map<String, dynamic>? mapValue;
      List<dynamic>? listValue;

      final mapResponse = await mdcHttp.get<Map<String, dynamic>>(getUrl);
      mapResponse.fold((l) => null, (r) => mapValue = r);

      expect(mapValue, isNotNull);
      expect(mapValue, isMap);
      expect(mapValue, isA<Map<String, dynamic>>());

      final listResponse = await mdcHttp.get<List<dynamic>>(getListUrl);
      listResponse.fold((l) => null, (r) => listValue = r);
      expect(listValue, isNotNull);
      expect(listValue, isList);
      expect(listValue?.isNotEmpty, true);
      expect(listValue, isA<List<dynamic>>());
    });

    test('Get Type', () async {
      TestModel? testModel;
      final response = await mdcHttp.getType<TestModel>(getUrl, fromJson: TestModel.fromJson);
      response.fold((l) => null, (r) => testModel = r);
      expect(testModel, isNotNull);
      expect(testModel, isA<TestModel>());
    });

    test('Get List Type', () async {
      List<TestModel>? testModelList;
      final response = await mdcHttp.getTypeList<TestModel>(getListUrl, fromJson: TestModel.fromJson);
      response.fold((l) => null, (r) => testModelList = r);
      expect(testModelList, isNotNull);
      expect(testModelList, isList);
      expect(testModelList, isA<List<TestModel>>());
      expect(testModelList?[0], isA<TestModel>());
    });

    test('Get empty List', () async {
      List<TestModel>? testModelList;
      final response = await mdcHttp.getTypeList<TestModel>(emptyList, fromJson: TestModel.fromJson);
      response.fold((l) => null, (r) => testModelList = r);
      expect(testModelList, isNotNull);
      expect(testModelList, isList);
      expect(testModelList, isA<List<TestModel>>());
      expect(testModelList?.isEmpty, true);
    });
  });

  group('Either', () {
    test('Right equals Right && Left', () async {
      const a = Right<int, Exception>(20);
      const b = Right<int, Exception>(20);
      expect(a, b);

      const c = Left<int, String>('Some Error');
      const d = Left<int, String>('Some Error');
      expect(c, d);
    });

    test('Either Call ifRight && ifLeft', () async {
      late int rithValue;
      late String leftValue;
      Either<int, String> getRight() => const Right(12);
      Either<int, String> getLeft() => const Left('Some Error');

      getRight().fold((l) => null, (r) => rithValue = r);
      expect(rithValue, 12);

      getLeft().fold((l) => leftValue = l, (r) => null);
      expect(leftValue, 'Some Error');
    });
  });
}
