import 'package:flutter/material.dart';

import 'grid_color_selector_item.dart';

class BaseGridColorSelectorItem implements GridColorSelectorItem<int> {
  BaseGridColorSelectorItem({
    @required this.key,
    @required this.primaryColor,
    this.secondaryColor,
    this.isEnabled = true,
  });

  @override
  bool isSelected(selectedKey) {
    if (selectedKey == null) {
      return false;
    }
    return this.key == selectedKey;
  }

  @override
  int key;

  @override
  bool isEnabled;

  @override
  Color primaryColor;

  @override
  Color secondaryColor;

  @override
  bool hasBothColors() {
    return this.primaryColor != null && this.secondaryColor != null;
  }
}
