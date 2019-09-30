'use strict';

const fabric = {
    network: require('fabric-network'),
}

const enroll = require('./enroll');

// const profile_path = './network.ca.yaml';
// const wallet = new fabric.network.FileSystemWallet('./wallet/from_ca');

async function registerClient(profile_path, wallet, registrar, registrant, mspid, affiliation) {
    if (!(await wallet.exists(registrar))) {
        console.log(`enroll user ${registrar} first`);
        return;
    }

    if (await wallet.exists(registrant)) {
        console.log(`client ${registrant} already exists`);
        return;
    }

    const connection_option = {
        wallet,
        identity: registrar,
        discovery: {
            enabled: true,
            asLocalhost: false,
        },
    };

    const register_option = {
        affiliation,
        enrollmentID: registrant,
        role: 'client'
    };

    try {
        const gateway = new fabric.network.Gateway();
        await gateway.connect(profile_path, connection_option);

        const ca = gateway.getClient().getCertificateAuthority();
        const admin_id = gateway.getCurrentIdentity();

        const secret = await ca.register(register_option, admin_id);
        await enroll(wallet, ca, mspid, registrant, secret);
    } catch (error) {
        console.log(`failed to register client: ${error.message}`);
        return;
    }

    console.log(`registered client ${registrant}`);
}

module.exports = registerClient;
