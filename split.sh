DIR=chapters
rm -rf $DIR
mkdir -p $DIR
PDF=$(find . -type f -name dissertation.pdf)
sejda-console splitbybookmarks --bookmarkLevel 1 --files $PDF --output $DIR -p [BOOKMARK_NAME]
mv "$DIR/[BOOKMARK_NAME].pdf" "$DIR/TABLE OF CONTENTS.pdf"

I=1
for PREFIX in I II III IV V VI VII VIII; do
    FILE=$(ls $DIR/$PREFIX\ *.pdf)
    mv "$FILE" "${FILE/$PREFIX/$I.}"
    I=$((I+1))
done

