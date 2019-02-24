#!/bin/bash

set -e

test -f curve.js || { echo "Error: curve.js not found."; exit 1; }

CLOSURE="`dirname $0`/closure/closure.jar"

test -f $CLOSURE || { echo "Error ${CLOSURE} not found."; exit 1; }

echo "combined.js ..."
java -jar $CLOSURE -O SIMPLE --js='bootstrap-select.js' --js='jquery.simplecolorpicker.js' --js='pixi.js' --js='TransparencyHitArea.js' --js='curve.js' --js='planner.js' --js_output_file combined.js --create_source_map='combined.js.map' --source_map_format=V3
printf "\n//# sourceMappingURL=combined.js.map" >> combined.js


echo "combined_mini.js ..."
java -jar $CLOSURE -O SIMPLE --js='bootstrap-select.js' --js='jquery.simplecolorpicker.js' --js='pixi.js' --js='TransparencyHitArea.js' --js='curve.js' --js_output_file combined_mini.js --create_source_map='combined_mini.js.map' --source_map_format=V3
printf "\n//# sourceMappingURL=combined_mini.js.map" >> combined_mini.js
