#!/bin/bash

npm run build
cp index.html dist/index.html

serve -s dist