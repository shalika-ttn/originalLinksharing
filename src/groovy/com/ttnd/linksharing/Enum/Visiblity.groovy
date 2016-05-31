package com.ttnd.linksharing.Enum

enum Visiblity {
  PUBLIC,PRIVATE

    public static Visiblity convert(String s) {
    return valueOf(s.toUpperCase())
  }
}

