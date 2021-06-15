set -e

VERSION=$(cat version | awk '{$1=$1;print}')
echo "publish version ${VERSION}"

git config --local user.name "bot"
git config --local user.email "bot@arcblock.io"

make release

echo "publishing blocklet..."
npm run release

echo "publishing to blocklet registry"
blocklet config registry ${BLOCKLET_REGISTRY}
blocklet publish --developer-sk ${ABTNODE_DEV_SK}

curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${NAME} v${VERSION} was successfully published\"}" ${SLACK_WEBHOOK}
