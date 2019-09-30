#!/usr/bin/env node

'use strict';
const path = require('path');

const fabric = {
    CA: require('fabric-ca-client'),
    network: require('fabric-network'),
}

const createAffiliation = require('./createAffiliation');
const enroll = require('./enroll');
const importFromLocalMSP = require('./importFromLocalMSP');
const registerClient = require('./registerClient');

const localMSPPath = 'crypto/peerOrganizations/abc.com/users/User1@abc.com/msp';
const localCertPath = path.join(localMSPPath, 'signcerts/User1@abc.com-cert.pem');
const localKeyPath = path.join(localMSPPath, 'keystore/b88eff6d4b1893bf1a5b95ccea9159278f127f4e3d33a329a3c8fffcf6c62f1d_sk');

const ca = new fabric.CA('http://ca.abc.com:7054');
const wallet = new fabric.network.FileSystemWallet('./wallet');

enroll(wallet, ca, 'ABCOrg', 'admin', 'adminpw')
    .then(async _ => {
        await createAffiliation(ca, wallet, 'admin', 'ABCOrg', 'abc');
        await createAffiliation(ca, wallet, 'admin', 'ABCOrg', 'abc.market');
        await registerClient('./network.ca.yaml', wallet, 'admin', 'User5', 'ABCOrg', 'abc.market');
    });

importFromLocalMSP('User1@abc.com', 'ABCOrg', localCertPath, localKeyPath);
