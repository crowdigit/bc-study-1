'use strict';

const { Contract } = require('fabric-contract-api');

class Account extends Contract {
    constructor() {
        super('Account');
    }

    async put_user(context, user_id, account) {
        if (user_id == null || account == null)
            throw new Error('invalid argument');

        const value = {
            user_id,
            account: account,
        };

        await context.stub.putState(user_id, JSON.stringify(value));
    }

    async get_user(context, user_id) {
        if (user_id == null)
            throw new Error('invalid argument');

        return (await context.stub.getState(user_id)).toString();
    }
};

module.exports = Account;
