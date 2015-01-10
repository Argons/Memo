guake shortcut show-hide problem: 
  https://wiki.archlinux.org/index.php/Guake 
  $gconftool-2 -t string -s /apps/guake/keybindings/global/show_hide "<Control>s"

Lightness monitoring:
  $sudo vim /etc/default/grub
  GRUB_CMDLINE_LINUX="acpi_backlight=vendor"
  $sudo update-grub

Change keyboard mapping:
  k = Caps_Lock
  keysym Escape = Caps_Lock
  keysym Caps_Lock = Escape
  add Lock = Caps_Lock
  $xmodmap map.sh

Add autorun shell script after booting:
  $sudo vim /etc/rc.local

vim python settings:
  spf13-vim

Anti-GFW:
  Chrome-extensions: hongxin.crx

wget tricks:
  $wget -r -l1 -H -t1 -nd -N -np -A.mp3 -erobots=off -i ~/url_list.txt 

vim plugin error:
  find its position in .vimrc, check if its been installed in .vim/bundle/

Convert ppt to pdf format:
  $libreoffice --headless --invisible --convert-to pdf *.pptx

安全与“输入输出”问题：
  黑客通过输入提交“特殊数据”，特殊数据在数据流的每个层处理，如果某个层没处理好，在输出的时候，就会出现相应层的安全问题。
  e.g.：
  1. 如果在操作系统层上没处理好，比如Linux的Bash环境把“特殊数据”当做指令执行时，就产生了OS命令执行的安全问题，
  这段“特殊数据”可能长得如下这般：
  ; rm -rf /;
  2. 如果在存储层的数据库中没处理好，数据库的SQL解析引擎把这个“特殊数据”当做指令执行时，就产生SQL注入这样的安全问题，
  这段“特殊数据”可能长得如下这般：
  ' union select user, pwd, 1, 2, 3, 4 from users-- '
  3. 如果在Web容器层如nginx中没处理好，nginx把“特殊数据”当做指令执行时，可能会产生远程溢出、DoS等各种安全问题，
  这段“特殊数据”可能长得如下这般：
  %c0.%c0./%c0.%c0./%c0.%c0./%c0.%c0./%20
  4. 如果在Web开发框架或Web应用层中没处理好，把“特殊数据”当做指令执行时，可能会产生远程命令执行的安全问题，
  这段“特殊数据”可能长得如下这般：
  eval($_REQUEST['x']);
  5. 如果在Web前端层中没处理好，浏览器的JS引擎把“特殊数据”当做指令执行时，可能会产生XSS跨站脚本的安全问题，
  这段“特殊数据”可能长得如下这般：
  '"><script>alert(/cos is my hero./)</script> '
  记好：一切的安全问题都体现在“输入输出”上，一切的安全问题都存在于“数据流”的整个过程中。

Stop tomcat:
  $/etc/init.d/tomcat7 stop
