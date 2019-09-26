'use strict';

const { Contract } = require('fabric-contract-api');
const http  = require('http');

function send_buy_request(seller_account, buyer_account, price) {
    return new Promise((resolve, reject) => {

        const request_body = {
            seller_account,
            buyer_account,
            price,
        };

        const option = {
            host: 'hello.bank',
            port: 4567,
            method: 'POST',
            path: '/buy',
        };

        const data = [];

        const request = http.request(
            option,
            response => {
                response.on('data', chunk => { data.push(chunk); })
                response.on('end', _ => resolve(data.toString()));
                response.on('error', error => reject(error.message));
            }
        );

        request.on('error', error => reject(error.message));
        request.setHeader('Content-Type', 'application/json');

        request.write(JSON.stringify(request_body));
        request.end();
    });
}

class Market extends Contract {
    constructor() {
        super('Market');
    }

    async put_seller(context, seller_id, item_number) {
        const seller = {
            seller_id,
            item_number: parseInt(item_number),
        };

        const seller_key = context.stub.createCompositeKey('seller', [seller_id]);
        await context.stub.putState(seller_key, JSON.stringify(seller));
    }

    async get_seller(context, seller_id) {
        const seller_key = context.stub.createCompositeKey('seller', [seller_id]);
        return (await context.stub.getState(seller_key)).toString();
    }

    async put_buyer(context, buyer_id, bill_number) {
        const buyer_key = context.stub.createCompositeKey('buyer', [buyer_id]);
        const buyer = {
            buyer_id,
            bill_number: parseInt(bill_number),
        };

        await context.stub.putState(buyer_key, JSON.stringify(buyer));
    }

    async get_buyer(context, buyer_id) {
        const buyer_key = context.stub.createCompositeKey('buyer', [buyer_id]);
        return (await context.stub.getState(buyer_key)).toString();
    }

    async put_product(context, seller_id, price) {
        const seller = JSON.parse(await this.get_seller(context, seller_id));

        const product = {
            seller_id,
            item_seq: seller.item_number,
            price,
        };

        const key = context.stub.createCompositeKey('product', [seller_id, product.item_seq.toString()]);

        await context.stub.putState(key, JSON.stringify(product));
        await this.put_seller(context, seller_id, (seller.item_number + 1).toString());
    }

    async get_product(context, seller_id, item_seq) {
        const key = context.stub.createCompositeKey('product', [seller_id, item_seq]);
        return (await context.stub.getState(key)).toString();
    }

    async get_seller_product(context, seller_id) {
        const it = await context.stub.getStateByPartialCompositeKey('product', [seller_id]);
        let i = { done: false };
        const result = [];

        while (!i.done) {
            i = await it.next();
            result.push(JSON.parse(i.value.value.toBuffer()));
        }
        return result;
    }

    async buy(context, buyer_id, seller_id, item_seq) {
        const buyer_private = JSON.parse((await context.stub.invokeChaincode('accountcc', ['get_user', buyer_id], 'accountc')).payload.toBuffer());
        const seller_private = JSON.parse((await context.stub.invokeChaincode('accountcc', ['get_user', seller_id], 'accountc')).payload.toBuffer());
        const product = JSON.parse(await this.get_product(context, seller_id, item_seq));
        const buyer = JSON.parse(await this.get_buyer(context, buyer_id));

        const bill = {
            seller: seller_id,
            buyer: buyer_id,
            paid: product.price,
            item_seq: parseInt(item_seq),
            bill_seq: buyer.bill_number,
        };

        const bill_key = context.stub.createCompositeKey('bill', [buyer_id, bill.bill_seq.toString()]);
        await context.stub.putState(bill_key, JSON.stringify(bill));

        await this.put_buyer(context, buyer_id, buyer.bill_number + 1);

        return await send_buy_request(seller_private.account, buyer_private.account, parseInt(product.price));
    }

    async get_bill(context, buyer_id, bill_number) {
        const bill_key = context.stub.createCompositeKey('bill', [buyer_id, bill_number]);
        return (await context.stub.getState(bill_key)).toString();
    }

    async get_buyer_bill(context, buyer_id) {
        const it = await context.stub.getStateByPartialCompositeKey('bill', [buyer_id]);
        let i = { done: false };
        const result = [];
        while (!i.done) {
            i = await it.next();
            result.push(JSON.parse(i.value.value.toBuffer()));
        }
        return result;
    }
};

module.exports = Market;
