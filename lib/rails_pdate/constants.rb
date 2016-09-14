# encoding: utf-8

#:stopdoc:
module RailsPdate
  module Constants
    GDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    PDaysInMonth = [31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29]
    PERSIAN_MONTH_NAMES = [nil, "فروردین","اردیبهشت","خرداد","تیر","مرداد","شهریور","مهر","آبان","آذر","دی","بهمن","اسفند"]
    PERSIAN_MONTH_NAMES_PINGLISH = [nil, "Farvardin", "Ordibehesht", "Khordad", "Tir", "Mordad", "Shahrivar", "Mehr", "Aban", "Azar", "Dey", "Bahman", "Esfand"]
    PERSIAN_WEEKDAY_NAMES = ["شنبه", "یک‌شنبه","دوشنبه","سه‌شنبه","چهارشنبه","پنج‌شنبه","جمعه"]
    PERSIAN_ABBR_WEEKDAY_NAMES = ["۱ش ","۲ش","۳ش","۴ش","۵ش","ج ","ش"]
    PERSIAN_MERIDIAN_INDICATOR = ["قبل از ظهر","بعد از ظهر"]
    PERSIAN_ABBR_MERIDIAN_INDICATOR = ["ق.ظ","ب.ظ"]
  end
end
#:startdoc: