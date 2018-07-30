const _ = require('lodash'),
    path = require('path'),
    basename = require('path').basename,
    dirname = require('path').dirname,
    extname = require('path').extname;

module.exports = function(opts) {
    opts = _.extend({
        blacklist: []
    }, (opts || {}));

    return function(files, metalsmith, done) {
        _.each(files, function (file, fn) {
            file.env = process.env;
        });
        done();
    };
};
