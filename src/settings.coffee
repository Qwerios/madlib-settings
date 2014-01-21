( ( factory ) ->
    if typeof exports is "object"
        module.exports = factory(
            require "underscore"
            require "madlib-object-utils"
        )
    else if typeof define is "function" and define.amd
        define( [
            "underscore"
            "madlib-object-utils"
        ], factory )

)( ( _, objectUtils ) ->
    # The shared settings object
    #
    settings = {}

    manager =
        init: ( key, data ) ->
            # Init is used for first time setting of defaults
            #
            currentData = settings[ key ]

            # Check if the current value is an object
            # If so merge the data but make sure the current data
            # remains intact
            #
            if currentData? and _.isObject( currentData )

                # NOTE: This is not a deep copy
                #
                settings[ key ] = _.extend( data, settings[ key ] )

            else if not currentData?
                # First time setting of the key
                #
                settings[ key ] = data

            return

        set: ( key, data ) ->
            settings[ key ] = data
            return

        get: ( key, valueIfMissing ) ->
            return objectUtils.get( key, settings, valueIfMissing )

        unset: ( key ) ->
            delete settings[ key ] if settings[ key ]?
            return

        purge: () ->
            settings = {}

        merge: ( key, data ) ->
            currentData = settings[ key ] or {}
            settings[ key ] = _.extend( currentData, data )
            return

        _raw: () ->
            return settings
)