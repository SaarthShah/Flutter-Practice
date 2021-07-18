import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class fakeHttpClient {
  Future<String> get(String url) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'Response from $url';
  }
}

// class IncrementNotifier extends ChangeNotifier {
//   int _value = 0;
//   int get value => _value;

//   void increment() {
//     _value++;
//     notifyListeners();
//   }
// }

// final incrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());

final fakeHttpClientProvider = Provider((_create) => fakeHttpClient());
final responseProvider =
    FutureProvider.family<String, String>((ref, url) async {
  final httpClient = ref.watch(fakeHttpClientProvider);
  return httpClient.get(url);
});

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Practice',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riverpod Practice'),
        ),
        body: Center(
          child: Consumer(builder: (context, watch, child) {
            final responseAsyncValue =
                watch(responseProvider('www.saarthshah.cf'));
            return responseAsyncValue.map(
                data: (_) => Text(_.value),
                loading: (_) => CircularProgressIndicator(),
                error: (_) => Text(
                      _.error.toString(),
                      style: TextStyle(color: Colors.red),
                    ));

            // final incrementNotifier = watch(incrementProvider);
            // return Text(incrementNotifier.value.toString());
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // context.read(incrementProvider).increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
