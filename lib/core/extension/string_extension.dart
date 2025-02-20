import 'dart:convert';
import 'dart:math';

import 'package:diacritic/diacritic.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../constants/regex_constant.dart';

extension StringExtension on String {
  bool get isEmail => EmailValidator.validate(this);

  String get removedDiacritic => removeDiacritics(this);

  bool get isSvg => toLowerCase().endsWith('.svg');

  bool get isIOSImageFormat =>
      toLowerCase().endsWith('.heic') || toLowerCase().endsWith('.heif');

  String get toNonNullString => this != "null" ? this : '';

  String cut(int length, [int start = 0]) {
    final endIndex = min(this.length, length);
    return substring(start, endIndex);
  }

  bool get isNum => num.tryParse(this) != null;

  List<int>? get listInteger {
    try {
      final list = replaceAll('[', '').replaceAll(']', '').split(', ').map((e) {
        return int.parse(e);
      }).toList();
      return list;
    } catch (err) {
      return null;
    }
  }

  String get decodedMessage {
    final String decodedMessage;
    if (listInteger != null) {
      decodedMessage = utf8.decode(listInteger!);
    } else {
      decodedMessage = "";
    }
    return decodedMessage;
  }

  String get encodedMessage {
    return utf8.encode(this).toString();
  }

  String get extractEmailFromChatUrlString {
    String email = '';
    final questionSymbolIndex = indexOf('?');
    final index = questionSymbolIndex > 0 ? questionSymbolIndex : length;
    if (index > 0) {
      email = substring(0, index);
    }
    return email;
  }

  bool get isOnlyEmoji {
    final emojisRegExp = RegExp(RegexConstant.emojisRegexString);
    String result = this;
    final emojis = emojisRegExp.allMatches(result);

    // return if none found
    if (emojis.isEmpty) return false;

    // remove all emojis from the this
    for (final emoji in emojis) {
      result =
          result.replaceAll(emoji.input.substring(emoji.start, emoji.end), "");
    }

    // remove all whitespace (optional)
    result = result.replaceAll(" ", "");

    // return true if nothing else left
    return result.isEmpty;
  }

  String useCorrectEllipsis() {
    return replaceAll('', '\u200B');
  }

  Duration get toDuration {
    int hours = 0;
    int minutes = 0;
    List<String> parts = split(':');
    if (parts.length > 1) {
      hours = int.parse(parts[parts.length - 2]);
    }
    if (parts.isNotEmpty) {
      minutes = int.parse(parts[parts.length - 1]);
    }
    return Duration(hours: hours, minutes: minutes);
  }

  String get correctUnicode {
    final charCode = int.tryParse(this);
    if (charCode == null) {
      return this;
    }
    return String.fromCharCode(charCode);
  }
}

extension ColorExtension on String {
  Color get toColor {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
