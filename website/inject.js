const _ = require('lodash'),
    readFileSync = require('fs').readFileSync;

module.exports = function(opts) {
    opts = _.extend({
        filenames: []
    }, (opts || {}));

    return function(files, metalsmith, done) {
        _.each(opts.filenames, function (filename) {
            const fn = filename.split("/").slice(-1);
            files[fn] = {contents: readFileSync(filename)};
            files[fn].links = files;
            files[fn].info = {title: "Home"}
        });
        done();
    };
};
