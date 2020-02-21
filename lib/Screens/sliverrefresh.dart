import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
        "https://images.unsplash.com/photo-1541701494587-cb58502866ab?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0c21b1ac3066ae4d354a3b2e0064c8be&auto=format&fit=crop&w=500&q=60",
        fit: BoxFit.cover,
      )),
    );
  }
}

class Refresher extends StatelessWidget {
  final RefreshController _refreshController = RefreshController();

  List<Widget> buildList() {
    return List.generate(
        15,
        (index) => Container(
              height: 100,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      header: Container(),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        _refreshController.refreshCompleted();
      },
      child: CustomScrollView(
        slivers: [SliverList(delegate: SliverChildListDelegate(buildList()))],
      ),
    );
  }
}
