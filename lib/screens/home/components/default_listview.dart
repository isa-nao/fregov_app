import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fregov_app/infrastracture/issue_list.dart';
import 'package:fregov_app/screens/home/components/card_with_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class DefaultListView extends ConsumerWidget {
  const DefaultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issueList = ref.watch(allIssueListProvider);
    return issueList.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Text('Error: $error'),
          data: (issueList) {
            return Column(
              children: <Widget> [
                Expanded(
                  child: ListView.builder(
                    itemCount: issueList.length,
                    itemBuilder: (context, index) {
                      final issue = issueList[index];
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