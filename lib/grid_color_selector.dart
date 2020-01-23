library grid_color_selector;

import 'package:flutter/material.dart';

import 'grid_color_selector_item.dart';

class GridColorSelector<TKey> extends StatefulWidget {
  final List<GridColorSelectorItem<TKey>> items;
  final Function(TKey selectedKey) onSelectionChanged;

  final TKey selectedItemKey;
  final String title;
  final bool multipleSelection = false;

  final Color backgroundColor;

  final Color disableBackgroundColor;

  final double itemSize;

  final double itemCircleSize;

  final double checkSize;

  final TextStyle titleTextStyle;

  GridColorSelector({
    @required this.title,
    @required this.items,
    @required this.onSelectionChanged,
    this.selectedItemKey,
    this.backgroundColor = Colors.transparent,
    this.disableBackgroundColor = Colors.black12,
    this.itemSize = 50.0,
    this.itemCircleSize = 40.0,
    this.checkSize = 24.0,
    this.titleTextStyle,
  });

  @override
  State<StatefulWidget> createState() {
    return _GridColorSelectorState<TKey>(this.selectedItemKey);
  }
}

class _GridColorSelectorState<TKey> extends State<GridColorSelector<TKey>> {
  TKey selectedItemKey;

  _GridColorSelectorState(this.selectedItemKey);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTitle(context),
        SizedBox(
          height: 4.0,
        ),
        _buildSelector(),
      ],
    );
  }

  Container _buildTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        widget.title.toUpperCase(),
        style: widget.titleTextStyle != null
            ? widget.titleTextStyle
            : Theme.of(context).textTheme.title,
      ),
    );
  }

  Container _buildSelector() {
    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        spacing: 2.0,
        children: buildItems(this.widget.items),
      ),
    );
  }

  List<Widget> buildItems(List<GridColorSelectorItem<TKey>> items) {
    return items.map(buildItem).toList();
  }

  Widget buildItem(GridColorSelectorItem<TKey> item) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(item);
      },
      child: Opacity(
        opacity: item.isEnabled ? 1.0 : 0.4,
        child: Container(
          color: item.isEnabled
              ? widget.backgroundColor
              : widget.disableBackgroundColor,
          width: widget.itemSize,
          height: widget.itemSize,
          child: _buildColors(item),
        ),
      ),
    );
  }

  Widget _buildColors(GridColorSelectorItem<TKey> item) {
    var primaryColor = _buildCircle(item.primaryColor);
    if (item.isSelected(this.selectedItemKey)) {
      primaryColor = _addCheckToCircle(primaryColor, item);
    }

    if (item.hasBothColors()) {
      return Stack(
        children: <Widget>[
          Positioned(
            child: _buildCircle(item.secondaryColor),
            left: 10.0,
            top: 0.0,
            bottom: 0.0,
          ),
          Positioned(
            child: primaryColor,
            left: 2.0,
            top: 0.0,
            bottom: 0.0,
          )
        ],
      );
    }

    return primaryColor;
  }

  Container _addCheckToCircle(Widget primaryColor, GridColorSelectorItem item) {
    return Container(
      height: widget.itemCircleSize,
      width: widget.itemCircleSize,
      child: Stack(
        children: <Widget>[
          primaryColor,
          Center(
            child: Icon(
              Icons.check,
              color: item.primaryColor == Colors.white
                  ? Colors.grey
                  : Colors.white,
              size: widget.checkSize,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Center(
      child: Container(
        height: widget.itemCircleSize,
        width: widget.itemCircleSize,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border:
                Border.all(color: color == Colors.white ? Colors.grey : color)),
      ),
    );
  }

  void _onItemTapped(GridColorSelectorItem item) {
    if (item.isEnabled) {
      setState(() {
        if (selectedItemKey != null && item.isSelected(selectedItemKey)) {
          widget.onSelectionChanged(null);
          selectedItemKey = null;
        } else {
          widget.onSelectionChanged(item.key);
          selectedItemKey = item.key;
        }
      });
    }
  }
}
