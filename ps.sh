#!/bin/bash
# ABOUT: Creates full-stack project structure

# Present running directory
prd="${BASH_SOURCE[0]/ps.sh/}"

# Create project directories
mkdir -p $1/webpack && touch $1/

mkdir -p $1/client/src/components && touch $1/client/src/components/.gitignore
mkdir -p $1/client/src/pages && touch $1/client/src/pages/.gitignore

mkdir -p $1/client/public/css && touch $1/client/public/css/.gitignore
mkdir -p $1/client/public/fonts && touch $1/client/public/fonts/.gitignore
mkdir -p $1/client/public/icons && touch $1/client/public/icons/.gitignore
mkdir -p $1/client/public/images && touch $1/client/public/images/.gitignore
mkdir -p $1/client/public/js && touch $1/client/public/js/.gitignore
mkdir -p $1/client/public/scss && touch $1/client/public/scss/.gitignored

# mkdir -p $1/server/bin && touch $1/server/bin/.gitignore
mkdir -p $1/server/controllers && touch $1/server/controllers/.gitignore
mkdir -p $1/server/routes && touch $1/server/routes/.gitignore

mkdir -p $1/template/css && touch $1/template/css/.gitignore
mkdir -p $1/template/fonts && touch $1/template/fonts/.gitignore
mkdir -p $1/template/icons && touch $1/template/icons/.gitignore
mkdir -p $1/template/images && touch $1/template/images/.gitignore
mkdir -p $1/template/js && touch $1/template/js/.gitignore
mkdir -p $1/template/scss && touch $1/template/scss/.gitignore

mkdir -p $1/tests/api && touch $1/tests/api/.gitignore
mkdir -p $1/tests/e2e && touch $1/tests/e2e/.gitignore
mkdir -p $1/tests/react && touch $1/tests/react/.gitignore

# Create empty readme file
touch $1/README.md

# Create license file 
cp $prd/files/LICENSE $1/

# Create webpack config files
cp $prd/files/client.prod.js $1/webpack/
cp $prd/files/client.dev.js $1/webpack/
cp $prd/files/server.dev.js $1/webpack/

# Create babel config file
cp $prd/files/.babelrc $1/

# Create package.json
cp $prd/files/package.json $1/

# Create eslint file
cp $prd/files/.eslintrc.json $1/

# Create ignore files 
printf 'node_modules/\nwebpack/\n**/public/*\n**/bin/*\n' > $1/.eslintignore
printf 'node_modules/\nwebpack/\n' > $1/.gitignore
printf 'bin/\n' > $1/server/.gitignore

# Install webpack, loaders, babel, eslint and cross-env
npm i -D webpack webpack-dev-server uglifyjs-webpack-plugin webpack-node-externals\
         babel-core babel-preset-env babel-preset-react \
         sass-loader babel-loader node-sass css-loader style-loader url-loader file-loader svg-inline-loader \
         eslint eslint-plugin-react eslint-plugin-jsx-a11y \
         cross-env