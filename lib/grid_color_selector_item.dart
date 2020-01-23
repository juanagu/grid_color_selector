import 'package:flutter/material.dart';

abstract class GridColorSelectorItem<TKey> {
  TKey key;

  Color primaryColor;

  Color secondaryColor;

  bool isEnabled;

  bool isSelected(TKey selectedKey);

  bool hasBothColors();
}
