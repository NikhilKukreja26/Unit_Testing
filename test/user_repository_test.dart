import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test/user_model.dart';
import 'package:unit_test/user_repository.dart';
import 'package:http/http.dart' as http;

class MockHTTPClient extends Mock implements http.Client {}
// So extending the mock class what we have done basically given all the properties that are required by implementing the client class

void main() {
  late MockHTTPClient mockHTTPClient;
  late UserRepository userRepository;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(
      client: mockHTTPClient,
    );
  });
  group('UserRepository -', () {
    group('getUser function', () {
      test(
        'Given UserRepository Class When GetUser Function Is Called And Status Code Is 200 Then A UserModel Should Be Returned',
        () async {
          // * Arrange
          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer(
            (invocation) async {
              return http.Response('''
{
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
}
''', 200);
              // return Future.value(http.Response('', 200));
            },
          );
          // * Act
          final user = await userRepository.getUser();
          // * Assert
          expect(user, isA<UserModel>());
        },
      );

      test(
        'Given UserRepository Class When GetUser Function Is Called And Status Code Is Not 200 Then Exception Should Be Thrown',
        () async {
          // * Arrange

          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer((invocation) async => http.Response('', 500));
          // * Act
          final user = userRepository.getUser();
          // * Assert
          expect(user, throwsException);
        },
      );
    });
  });
}
