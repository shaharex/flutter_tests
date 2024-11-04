import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_flut/album.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("fetchAlbum", () {
    test("returns an Album if the http call completes succesfully", () async {
      final client = MockClient();

      // using mockito to return successfull response
      when(client.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"))
      ).thenAnswer((_) async => http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchAlbum(client), isA<Album>());
    });

      test("throws an exception if the http call completes with an error", () async {
      final client = MockClient();

      // using mockito to return unsuccessfull response
      when(client.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"))
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });

  });


  
}
