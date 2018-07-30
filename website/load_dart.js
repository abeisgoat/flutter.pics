const _ = require('lodash'),
      path = require('path'),
      basename = require('path').basename,
      dirname = require('path').dirname,
      extname = require('path').extname;

module.exports = function(opts) {
    opts = _.extend({
        key: 'data'
    }, (opts || {}));

    return function(files, metalsmith, done) {
        _.each(files, function (file, fn) {
            const id = basename(fn, extname(fn));
            const filename =  `${id}.hbs`;
            // if (path.extname(key) === '.json') {
            //     file["_json"] = JSON.parse(file.contents);
            // }
            files[filename] = file;
            file.id = id;
            delete files[fn];
            // console.log(file.contents.toString());
        });

        // _.each(files, function (file, key) {
        //   if (file.load_json) {
        //     file[opts.key] = files[file.load_json]._json;
        //   }
        // });

        done();
    };
};
