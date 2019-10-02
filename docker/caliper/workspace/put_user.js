/*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

'use strict';

module.exports.info  = 'putting accounts';

let tx_per_batch = null;
let account_max = null;
let blockchain = null;
let context = null;

module.exports.init = function(bc, ctx, args) {
    if (args.account_max == null)
        args.account_max = 10000;

    if (args.tx_per_batch == null)
        args.tx_per_batch = 10;

    account_max = args.account_max;
    tx_per_batch = args.tx_per_batch;
    blockchain = bc;
    context = ctx;

    return Promise.resolve();
};

function generate_workload() {
    let workload = [];
    for(let i= 0; i < tx_per_batch; i++) {
        let account_number = Math.floor(Math.random() * account_max);
        workload.push({
            chaincodeFunction: 'put_user',
            chaincodeArguments: [`user_${account_number}`, `account_${account_number}`],
        });
    }
    return workload;
}

module.exports.run = function() {
    let args = generate_workload();
    return blockchain.invokeSmartContract(context, 'accountcc', '0', args, 100);
};

module.exports.end = function() {
    return Promise.resolve();
};
