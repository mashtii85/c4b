import 'package:c4b/config/fixture_provider.dart';
import 'package:flutter/widgets.dart';

import 'custom_progress_indicator.dart';

class PagedListView extends StatefulWidget {
   const PagedListView({
    super.key,
    required this.getNextPageCallBack,
    required this.hasNextPage,
    required this.itemLength,
    required this.itemBuilder,
    this.divider
  });

  final bool hasNextPage;
  final int itemLength;
  final void Function() getNextPageCallBack;
  final Widget Function(int index) itemBuilder;
  final Widget? divider;

  @override
  State<StatefulWidget> createState() => _PagedGridViewState();
}

class _PagedGridViewState extends State<PagedListView> {
  late Widget divider;
  late ScrollController _scrollController;
  bool indicator = false;
  int index = 0;

  @override
  void initState() {
    divider = widget.divider??Container();
    _scrollController = ScrollController();
    super.initState();
  }

  bool _handleScrollNotification(
      ScrollNotification notification, bool hasNextPage) {
    if (_scrollController.positions.isNotEmpty &&
        hasNextPage &&
        _scrollController.position.extentAfter < 50) {
      setState(() {
        indicator = true;
      });
    } else {
      setState(() {
        indicator = false;
      });
    }
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter < 50) {
      if (hasNextPage) widget.getNextPageCallBack();
    }
    return false;
  }

  @override
  void didUpdateWidget(PagedListView oldWidget) {
    if (oldWidget.itemLength < widget.itemLength) {
      setState(() {
        indicator = false;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.itemLength == 0
        ? const Center(
            child: Text('Empty'),
          )
        : Container(
            child: (NotificationListener<ScrollNotification>(
              onNotification: (notification) =>
                  _handleScrollNotification(notification, widget.hasNextPage),
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[list(), progressIndicator()],
              ),
            )),
          );
  }

  ListView list() {
    return ListView.separated(
        padding: const EdgeInsets.only(bottom: 50),
        itemCount: widget.itemLength,
        controller: _scrollController,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => divider,
        itemBuilder: (context, index) {
          return widget.itemBuilder(index);
        });
  }

  Visibility progressIndicator() {
    return Visibility(
      visible: indicator,
      child: Positioned(
        bottom: -80,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomProgressIndicator(
              type: ProgressIndicatorType.Pulse,
              color: fixtures.colorPalette.primaryColor,
              size: 150,
            )),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
