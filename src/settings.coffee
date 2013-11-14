( ( factory ) ->
    if typeof exports is "object"
        module.exports = factory(
            require "underscore"
        )

    else if typeof define is "function" and define.amd
        define( [
            "underscore"
        ], factory )

)( ( _ ) ->
    # The managed settings object
    #
    settings = {}

    manager =
        init: ( key, data ) ->
            # Init is used for first time setting of defaults
            #
            currentData = settings[ key ] or {}
            settings [ key ] = _.extend( data, currentData )
            return

        set: ( key, data ) ->
            settings [ key ] = data
            return

        extend: ( key, data ) ->
            currentData = settings[ key ] or {}
            settings [ key ] = _.extend( currentData, data )
            return

        get: ( key, valueIfMissing ) ->
            return settings[ key ] or valueIfMissing

        _raw: () ->
            return settings
)