# encoding: utf-8

class Pconvertor

  def gregorian_to_persian(year, month, day) # :nodoc:
    jj=0
    gy = year - 1600
    gm = month - 1
    gd = day - 1
    g_day_no = 365*gy + (gy+3)/4 - (gy+99)/100 + (gy+399)/400
    gm.times { |i| g_day_no += GDaysInMonth[i] }
    g_day_no += 1 if gm > 1 && ((gy%4 == 0 && gy%100 != 0) || (gy%400 == 0))
    g_day_no += gd

    j_day_no = g_day_no-79
    j_np = j_day_no/12053
    j_day_no %= 12053
    jy = 979 + 33 * j_np + 4*(j_day_no/1461)
    j_day_no %= 1461

    if (j_day_no >= 366)
      jy += (j_day_no - 1)/365
      j_day_no = (j_day_no - 1) % 365
    end

    11.times do |i|
      if j_day_no >= PDaysInMonth[i]
        j_day_no -= PDaysInMonth[i]
        jj = i + 1
      else
        jj = i
        break
      end
    end
    jm = jj + 1
    jd = j_day_no + 1

    [jy, jm, jd]
  end


  def persian_to_gregorian(year,month,day) # :nodoc:
    gg=0
    jy = year - 979
    jm = month - 1
    jd = day - 1
    j_day_no = 365*jy + (jy/33)*8 + (jy % 33 + 3)/4
    jm.times { |i| j_day_no += PDaysInMonth[i] }
    j_day_no += jd

    g_day_no = j_day_no + 79
    gy = 1600 + 400*(g_day_no/146097)
    g_day_no %= 146097

    leap = true
    if g_day_no >= 36525
      g_day_no -= 1
      gy += 100 * (g_day_no/36524)
      g_day_no %= 36524
      (g_day_no >= 365) ? g_day_no += 1 : leap = false
    end

    gy += 4 * (g_day_no/1461)
    g_day_no %= 1461

    if g_day_no >= 366
      leap = false
      g_day_no -= 1
      gy += g_day_no/365
      g_day_no %= 365
    end

    11.times do |i|
      leap_day = (i==1 && leap) ? 1 : 0
      if g_day_no >= (GDaysInMonth[i] + leap_day )
        g_day_no -= (GDaysInMonth[i] + leap_day )
        gg = i + 1
      else
        gg = i
        break
      end
    end
    gm = gg + 1
    gd = g_day_no + 1

    [gy,gm,gd]
  end
end