'use strict';

const fs = require('fs');
const fabric = {
    network: require('fabric-network'),
};

async function importFromLocalMSP(label, msp_id, cert_path, key_path) {
    const cert = fs.readFileSync(cert_path).toString();
    const key  = fs.readFileSync(key_path).toString();

    const wallet = new fabric.network.FileSystemWallet('./wallet');
    if ((await wallet.exists(label))) {
        console.log(`lable '${label} already imported'`);
        return;
    }

    const identity = fabric.network.X509WalletMixin.createIdentity(msp_id, cert, key);

    wallet.import(label, identity).then(
        _     => console.log('wrote identity into file'),
        error => console.log(`failed to write wallet: ${error.message}`)
    );
}

module.exports = importFromLocalMSP;
