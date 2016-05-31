package com.ttnd.linksharing.Enum

enum Seriousness {
  SERIOUS, VERY_SERIOUS, CASUAL


  public static Seriousness convert(String s) {
    return valueOf(s.toUpperCase())
  }
}