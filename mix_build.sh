#!/usr/bin/bash
if [[ ! -f mix.log ]]; then
    mix deps.get
    echo "First deps checked" > mix.log
fi

if [[ -f mix_category.exs ]]; then
    echo "Build of category"
    cp mix_category.exs mix.exs
    mix docs
    rm -f mix.exs
fi
if [[ ! -f doc/doc-versions.js ]]; then
    cp priv/assets/doc-versions.js doc/
fi

if [[ -f mix_packages.exs ]]; then
    echo "Build of packages"
    cp mix_packages.exs mix.exs
    mix docs
    rm -f mix.exs
fi
if [[ ! -f doc/packages/doc-versions.js ]]; then
    cp priv/assets/packages/doc-versions.js doc/packages
fi

echo "Doc builded in doc\ folder."
echo ""
echo "Run firefox doc/index.html or firefox doc/packages/readme.html to verify changes"
