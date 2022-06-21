import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/posts/provider/post_notifier.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFED8975),
          brightness: Brightness.dark,
          surface: const Color(0xFF8FB9AA),
        ),
      ),
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends ConsumerWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postNotifier = ref.watch(postNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: ref.read(postNotifierProvider.notifier).fetchPosts,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return ListView.builder(
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(title: Text(postNotifier.postsList![i].body)),
                );
              },
              itemCount: postNotifier.postsList?.length ?? 0,
            );
          },
        ),
      ),
    );
  }
}
