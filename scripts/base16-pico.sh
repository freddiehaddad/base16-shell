#!/bin/sh
# base16-shell (https://github.com/tinted-theming/base16-shell)
# Scheme name: Pico 
# Scheme author: PICO-8 (http://www.lexaloffle.com/pico-8.php)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export BASE16_THEME=pico

color00="00/00/00" # Base 00 - Black
color01="ff/00/4d" # Base 08 - Red
color02="00/e7/56" # Base 0B - Green
color03="ff/f0/24" # Base 0A - Yellow
color04="83/76/9c" # Base 0D - Blue
color05="ff/77/a8" # Base 0E - Magenta
color06="29/ad/ff" # Base 0C - Cyan
color07="5f/57/4f" # Base 05 - White
color08="00/87/51" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="ff/f1/e8" # Base 07 - Bright White
color16="ff/a3/00" # Base 09
color17="ff/cc/aa" # Base 0F
color18="1d/2b/53" # Base 01
color19="7e/25/53" # Base 02
color20="ab/52/36" # Base 04
color21="c2/c3/c7" # Base 06
color_foreground="5f/57/4f" # Base 05
color_background="00/00/00" # Base 00

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' $@; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' $@; }
  put_template_custom() { printf '\033]%s%s\033\\' $@; }
fi

# 16 color space
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg 5f574f # foreground
  put_template_custom Ph 000000 # background
  put_template_custom Pi 5f574f # bold color
  put_template_custom Pj 7e2553 # selection color
  put_template_custom Pk 5f574f # selected text color
  put_template_custom Pl 5f574f # cursor
  put_template_custom Pm 000000 # cursor text
else
  put_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background

# Optionally export variables
if [ -n "$BASE16_SHELL_ENABLE_VARS" ]; then
  export BASE16_COLOR_00_HEX="000000"
  export BASE16_COLOR_01_HEX="1d2b53"
  export BASE16_COLOR_02_HEX="7e2553"
  export BASE16_COLOR_03_HEX="008751"
  export BASE16_COLOR_04_HEX="ab5236"
  export BASE16_COLOR_05_HEX="5f574f"
  export BASE16_COLOR_06_HEX="c2c3c7"
  export BASE16_COLOR_07_HEX="fff1e8"
  export BASE16_COLOR_08_HEX="ff004d"
  export BASE16_COLOR_09_HEX="ffa300"
  export BASE16_COLOR_0A_HEX="fff024"
  export BASE16_COLOR_0B_HEX="00e756"
  export BASE16_COLOR_0C_HEX="29adff"
  export BASE16_COLOR_0D_HEX="83769c"
  export BASE16_COLOR_0E_HEX="ff77a8"
  export BASE16_COLOR_0F_HEX="ffccaa"
fi