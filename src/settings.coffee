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

    ###*
    #   Settings manager to be used with other madlib modules
    #
    #   @author     mdoeswijk
    #   @module     settingsManager
    #   @version    0.1
    ###
    settingsManager =

        ###*
        #   Used to initially set a setttings value.
        #   Convenient for settings defaults that wont overwrite already set actual values
        #
        #   @function init
        #   @param {String} key     The setting name
        #   @param {Mixed}  data    The setting value
        #
        #   @return None
        #
        ###
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

        ###*
        #   Used to set a settings value
        #
        #   @function set
        #   @param {String} key     The setting name
        #   @param {Mixed}  data    The setting value
        #
        #   @return None
        #
        ###
        set: ( key, data ) ->
            objectUtils.setValue( key, settings, data )
            return

        ###*
        #   Used to retrieve a setting value
        #
        #   @function get
        #   @param {String} key                 The setting name
        #   @param {Mixed}  [valueIfMissing]    Optional value to return if the setting isn't set
        #
        #   @return None
        #
        ###
        get: ( key, valueIfMissing ) ->
            return objectUtils.getValue( key, settings, valueIfMissing )

        ###*
        #   Removed a setting
        #
        #   @function unset
        #   @param {String} key     The setting name
        #
        #   @return None
        #
        ###
        unset: ( key ) ->
            delete settings[ key ] if settings[ key ]?
            return

        ###*
        #   Removes all settings. Use with caution.
        #
        #   @function purge
        #
        #   @return None
        #
        ###
        purge: () ->
            settings = {}

        ###*
        #   Merge a setting using underscore's extend.
        #   Only useful if the setting is an object
        #
        #   @function merge
        #   @param {String} key     The setting name
        #   @param {Mixed}  data    The setting value
        #
        #   @return None
        #
        ###
        merge: ( key, data ) ->
            currentData = settings[ key ] or {}
            settings[ key ] = _.extend( currentData, data )
            return

        ###*
        #   Private method to return the actual settings object
        #
        #   @function _raw
        #   @private
        #
        #   @return {Object}    The raw settings object
        #
        ###
        _raw: () ->
            return settings

        ###*
        #   Private method to overwrite actual settings object
        #
        #   @function _setRaw
        #   @private
        #
        #   @return {Object}    The raw settings object
        #
        ###
        _setRaw: ( newSettings ) ->
            settings = _.clone( newSettings )
            return settings
)