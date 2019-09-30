'use strict';

const fabric = {
    CA: require('fabric-ca-client'),
    network: require('fabric-network'),
}

async function enroll(wallet, ca, msp, id, pw) {
    const enrollment = await ca.enroll({ enrollmentID: id, enrollmentSecret: pw });
    const identity = fabric.network.X509WalletMixin.createIdentity(msp, enrollment.certificate, enrollment.key.toBytes());
    await wallet.import(id, identity);
    console.log('got admin enrollment into wallet');
}

module.exports = enroll;
