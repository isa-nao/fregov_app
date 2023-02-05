import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fregov_app/models/issue_model.dart';
import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:fregov_app/screens/home/components/search_box.dart';


final hitsSearcherProvider = Provider<HitsSearcher>((ref) => HitsSearcher(
    applicationID: "ZVKZO9OBVF",
    apiKey: "1cee41ecf84443e9cfdcfa6e13dafb51",
    indexName: "dev_FREGOV"));


final hitsIssueListProvider = StreamProvider.autoDispose((ref) async* {
  final _searcher = ref.watch(hitsSearcherProvider);
  final _searchWords = ref.watch(searchWordProvider);
  _searcher.query(_searchWords);
  await for (final res in _searcher.responses) {
    yield res.hits.map((e) => Issue.fromJson(e)).toList();
  }
}, dependencies: [searchWordProvider, hitsSearcherProvider]);
