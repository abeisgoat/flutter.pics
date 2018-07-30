const Metalsmith = require('metalsmith'),
    metalsmith_in_place = require('metalsmith-in-place'),
    metalsmith_layouts = require('metalsmith-layouts'),
    load_dart = require('./load_dart'),
    load_env = require('./load_env'),
    inject = require("./inject");

Metalsmith(__dirname)
    .source('../lib/examples/')
    .use(load_dart({
        blacklist: ["rounded_image.dart"]
    }))
    .use(load_env())
    .use(inject({filenames: ["pages/index.hbs"]}))
    .use(metalsmith_in_place())
    .use(metalsmith_layouts({default: "code.hbs"}))
    .destination('./build')
    .build((err) => {
        if (err) {
            throw err;
        } else {
            console.log("Built.");
        }
    });
