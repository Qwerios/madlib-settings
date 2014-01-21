(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory(require("underscore"), require("madlib-object-utils"));
    } else if (typeof define === "function" && define.amd) {
      return define(["underscore", "madlib-object-utils"], factory);
    }
  })(function(_, objectUtils) {
    var manager, settings;
    settings = {};
    return manager = {
      init: function(key, data) {
        var currentData;
        currentData = settings[key];
        if ((currentData != null) && _.isObject(currentData)) {
          settings[key] = _.extend(data, settings[key]);
        } else if (currentData == null) {
          settings[key] = data;
        }
      },
      set: function(key, data) {
        objectUtils.setValue(key, settings, data);
      },
      get: function(key, valueIfMissing) {
        return objectUtils.get(key, settings, valueIfMissing);
      },
      unset: function(key) {
        if (settings[key] != null) {
          delete settings[key];
        }
      },
      purge: function() {
        return settings = {};
      },
      merge: function(key, data) {
        var currentData;
        currentData = settings[key] || {};
        settings[key] = _.extend(currentData, data);
      },
      _raw: function() {
        return settings;
      }
    };
  });

}).call(this);
