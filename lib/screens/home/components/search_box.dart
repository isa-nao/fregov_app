import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchWordProvider = StateNotifierProvider<SearchWordNotifier, String>((ref) {
  return SearchWordNotifier();
});

class SearchWordNotifier extends StateNotifier<String> {
  SearchWordNotifier(): super("");

  void addSearchWord(String searchWord) {
    state = searchWord;
  }
}

class SearchBox extends ConsumerWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = TextEditingController();
    
    return TextField(
      decoration: const InputDecoration(
        hintText: "キーワード検索（例：観光,動画,広報)",
        fillColor: Colors.white,
        filled: true,
      ),
      controller: _controller,
      onChanged: (value) => ref.read(searchWordProvider.notifier).addSearchWord(value),
    );
  }
}