chai        = require "chai"
settings    = require "../lib/settings.js"

describe( "settings", () ->
    describe( "#setItem()", () ->
        it( "Should init setting", () ->
            settings.init( "init-test", "done" )

            chai.expect( settings.get( "init-test" ) ).to.eql( "done" )
        )

        it( "Should set setting", () ->
            settings.init( "set-test", "done" )
            chai.expect( settings.get( "set-test" ) ).to.eql( "done" )
        )

        it( "Should unset setting", () ->
            settings.init( "unset-test", "done" )
            settings.unset( "unset-test" )
            chai.expect( settings.get( "unset-test" ) ).to.eql( undefined )
        )
    )
)