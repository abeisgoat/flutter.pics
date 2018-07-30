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
            if (opts.blacklist.indexOf(fn) == -1) {
                const id = basename(fn, extname(fn));
                const filename = `${id}.hbs`;

                const lines = file.contents.toString().split("\n");
                file.info = JSON.parse(lines[0].replace("//", "").trim());
                file.contents = file.contents = new Buffer(lines.slice(1).join("\n"));

                files[filename] = file;
                file.id = id;
            }
            delete files[fn];
        });
        done();
    };
};
