const Metalsmith = require('metalsmith'),
    metalsmith_in_place = require('metalsmith-in-place'),
    metalsmith_layouts = require('metalsmith-layouts'),
    load_dart = require('./load_dart');

Metalsmith(__dirname)
    .source('../lib/examples/')
    .use(load_dart())
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
