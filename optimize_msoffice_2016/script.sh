
find . -type d -depth 1 -name "*.app" | { \
   while read d; do \
      sudo ln -s ../../../DFonts "$d/Contents/Resources/DFonts";
      sudo ln -s ../../../Fonts "$d/Contents/Resources/Fonts";
      sudo ln -s ../../Frameworks "$d/Contents/Frameworks";
      sudo ln -s ../../SharedSupport "$d/Contents/SharedSupport";
   done; }
