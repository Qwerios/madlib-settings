(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory(require("underscore"), require("madlib-object-utils"));
    } else if (typeof define === "function" && define.amd) {
      return define(["underscore", "madlib-object-utils"], factory);
    }
  })(function(_, objectUtils) {
    var settings, settingsManager;
    settings = {};
    /**
    #   Settings manager to be used with other madlib modules
    #
    #   @author     mdoeswijk
    #   @module     settingsManager
    #   @version    0.1
    */

    return settingsManager = {
      /**
      #   Used to initially set a setttings value.
      #   Convenient for settings defaults that wont overwrite already set actual values
      #
      #   @function init
      #   @param {String} key     The setting name
      #   @param {Mixed}  data    The setting value
      #
      #   @return None
      #
      */

      init: function(key, data) {
        var currentData;
        currentData = settings[key];
        if ((currentData != null) && _.isObject(currentData)) {
          settings[key] = _.extend(data, settings[key]);
        } else if (currentData == null) {
          settings[key] = data;
        }
      },
      /**
      #   Used to set a settings value
      #
      #   @function set
      #   @param {String} key     The setting name
      #   @param {Mixed}  data    The setting value
      #
      #   @return None
      #
      */

      set: function(key, data) {
        objectUtils.setValue(key, settings, data);
      },
      /**
      #   Used to retrieve a setting value
      #
      #   @function get
      #   @param {String} key                 The setting name
      #   @param {Mixed}  [valueIfMissing]    Optional value to return if the setting isn't set
      #
      #   @return None
      #
      */

      get: function(key, valueIfMissing) {
        return objectUtils.getValue(key, settings, valueIfMissing);
      },
      /**
      #   Removed a setting
      #
      #   @function unset
      #   @param {String} key     The setting name
      #
      #   @return None
      #
      */

      unset: function(key) {
        if (settings[key] != null) {
          delete settings[key];
        }
      },
      /**
      #   Removes all settings. Use with caution.
      #
      #   @function purge
      #
      #   @return None
      #
      */

      purge: function() {
        return settings = {};
      },
      /**
      #   Merge a setting using underscore's extend.
      #   Only useful if the setting is an object
      #
      #   @function merge
      #   @param {String} key     The setting name
      #   @param {Mixed}  data    The setting value
      #
      #   @return None
      #
      */

      merge: function(key, data) {
        var currentData;
        currentData = settings[key] || {};
        settings[key] = _.extend(currentData, data);
      },
      /**
      #   Private method to return the actual settings object
      #
      #   @function _raw
      #   @private
      #
      #   @return {Object}    The raw settings object
      #
      */

      _raw: function() {
        return settings;
      }
    };
  });

}).call(this);
