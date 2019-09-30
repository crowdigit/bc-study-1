'use strict';

const fabric = {
    network: require('fabric-network'),
};

const invoke = require('./invoke');

const wallet = new fabric.network.FileSystemWallet('./wallet');
invoke('./network.invoke.yaml', wallet, 'User5', 'accountc', 'accountcc', 'put_user', ['user_1', 'account_1'])
    .then(_ => {
        console.log('sent transaction');
    });
