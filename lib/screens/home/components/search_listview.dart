import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fregov_app/infrastracture/search_issue_list.dart';
import 'package:fregov_app/screens/home/components/card_with_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchListView extends ConsumerWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchIssueList = ref.watch(hitsIssueListProvider);
    return searchIssueList.when(
          loading: () => const Center(child: Text('検索結果が表示されます')),
          error: (error, stack) => Text('Error: $error'),
          data: (searchIssueList) {
            return Column(
              children: <Widget> [
                Expanded(
                  child: ListView.builder(
                    itemCount: searchIssueList.length,
                    itemBuilder: (context, index) {
                      final issue = searchIssueList[index];
                      return CardWithButton(
                        header: issue.cityName,
                        title: issue.issueTitle,
                        footer: '更新日:${issue.updateTime}',
                        buttontext: '詳細をみる',
                        onPressed: () async {
                          if(await canLaunchUrl(Uri.parse(issue.detailUrl))){
                                await launchUrl(Uri.parse(issue.detailUrl));
                          }
                        },
                      );
                    }
                  ),
                ),
              ],
            );
          }
    );
  }
}