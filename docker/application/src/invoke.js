'use strict';

const fabric = {
    network: require('fabric-network'),
}

async function invoke(profile_path, wallet, client, channel, contract_name, function_, args) {
    const connect_option = {
        wallet,
        identity: client,
        discovery: { enabled: true, asLocalhost: false },
    };

    const gateway = new fabric.network.Gateway();
    await gateway.connect(profile_path, connect_option);

    const network = await gateway.getNetwork(channel);
    const contract = network.getContract(contract_name);

    await contract.submitTransaction(function_, ...args);
    await gateway.disconnect();
}

module.exports = invoke;
