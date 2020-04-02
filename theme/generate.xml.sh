#!/bin.sh

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
echo "<gresources>"
echo "<gresource prefix=\"/org/gnome/shell/theme\">"

for file in theme/icons/*.svg; do
    echo "<file>icons/$(basename "$file")</file>"
done

for file in theme/*.svg; do
    echo "<file>$(basename "$file")</file>"
done

for file in theme/*.png; do
    echo "<file>$(basename "$file")</file>"
done

for file in theme/*.css; do
    echo "<file>$(basename "$file")</file>"
done

echo "</gresource>"
echo "</gresources>"