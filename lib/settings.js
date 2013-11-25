(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory(require("underscore"));
    } else if (typeof define === "function" && define.amd) {
      return define(["underscore"], factory);
    }
  })(function(_) {
    var manager, settings;
    settings = {};
    return manager = {
      init: function(key, data) {
        var currentData;
        currentData = settings[key] || {};
        settings[key] = _.extend(data, currentData);
      },
      set: function(key, data) {
        settings[key] = data;
      },
      get: function(key, valueIfMissing) {
        return settings[key] || valueIfMissing;
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