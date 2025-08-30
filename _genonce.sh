#!/bin/bash
set -e

# Run IG Publisher (automatically runs SUSHI for FSH files)
echo "Running IG Publisher..."
java -jar input-cache/publisher.jar -ig .

echo "Build complete. Open output/index.html to view the IG."