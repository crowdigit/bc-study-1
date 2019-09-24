#!/bin/bash

echo ""
echo "--- system channel ---"
# system channel genesis block
configtxgen -channelID lecturesystemc -configPath . -outputBlock ../artifact/block.lecturesystemc.0 -profile LectureSystemChannel

echo ""
echo "--- application channel ---"
# application channel creation
configtxgen -channelID accountc -configPath . -outputCreateChannelTx ../artifact/tx.accountc.create -profile LectureApplicationChannel
configtxgen -channelID marketc -configPath . -outputCreateChannelTx ../artifact/tx.marketc.create -profile LectureApplicationChannel

# anchor peers
echo ""
echo "--- organization ABC anchor ---"
configtxgen -asOrg ABCOrg -channelID accountc -configPath . -outputAnchorPeersUpdate ../artifact/tx.accountc.anchor.abc -profile LectureApplicationChannel
configtxgen -asOrg ABCOrg -channelID marketc -configPath . -outputAnchorPeersUpdate ../artifact/tx.marketc.anchor.abc -profile LectureApplicationChannel
echo ""
echo "--- organization XYZ anchor ---"
configtxgen -asOrg XYZOrg -channelID accountc -configPath . -outputAnchorPeersUpdate ../artifact/tx.accountc.anchor.xyz -profile LectureApplicationChannel
configtxgen -asOrg XYZOrg -channelID marketc -configPath . -outputAnchorPeersUpdate ../artifact/tx.marketc.anchor.xyz -profile LectureApplicationChannel
echo ""
echo "--- organization IJK anchor ---"
configtxgen -asOrg IJKOrg -channelID accountc -configPath . -outputAnchorPeersUpdate ../artifact/tx.accountc.anchor.ijk -profile LectureApplicationChannel
configtxgen -asOrg IJKOrg -channelID marketc -configPath . -outputAnchorPeersUpdate ../artifact/tx.marketc.anchor.ijk -profile LectureApplicationChannel
