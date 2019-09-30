'use strict';

const fabric = {
    CA: require('fabric-ca-client'),
    network: require('fabric-network'),
    client: require('fabric-client'),
}

async function createAffiliation(ca, wallet, registrar, mspid, name) {
    if (!await wallet.exists(registrar)) {
        console.log('enroll registrar first');
        return;
    }

    const registrar_id = await wallet.export(registrar);
    const client = fabric.client.loadFromConfig('./network.ca.yaml');
    await client.initCredentialStores();

    const opts = {
        username: registrar,
        mspid,
        cryptoContent: {
            privateKeyPEM: registrar_id.privateKey,
            signedCertPEM: registrar_id.certificate,
        },
    };

    try {
        const user = await client.createUser(opts);

        const affiliation = await ca.newAffiliationService();
        const response = await affiliation.create({ name }, user);
        if  (!response.success) {
            console.log(`kailed to create affilation: ${response.Errors}`);
        } else {
            console.log(`created affiliation: ${response.Messages}`)
        }

    } catch (error) {
        console.log(`failed to create affiliation: ${error.message}`);
    }
}

module.exports = createAffiliation;
