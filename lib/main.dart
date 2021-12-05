import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final myProvider = StateProvider((ref) => 100);

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    int myValue = ref.watch(myProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Some number $myValue'),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                ref.read(myProvider.state).state++;
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
