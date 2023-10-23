swift package --allow-writing-to-directory Docs \
  generate-documentation \
    --product Beton \
    --output-path Docs \
    --disable-indexing \
    --enable-inherited-docs \
    --transform-for-static-hosting \
    --source-service github \
    --source-service-base-url https://github.com/21GramConsulting/Beton/blob/master \
    --checkout-path $PWD

##    --warnings-as-errors \