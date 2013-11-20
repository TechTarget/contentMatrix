/*!
contentMatrix v1.0.0 (https://github.com/TechTarget/contentMatrix)
Author: Morgan Wigmanich <okize123@gmail.com> (http://github.com/okize)
Copyright (c) 2013 | Licensed under the MIT license
http://www.opensource.org/licenses/mit-license.php
*/


(function() {
  (function(factory) {
    if (typeof define === 'function' && define.amd) {
      return define(['jquery'], factory);
    } else {
      return factory(jQuery);
    }
  })(function($) {
    'use strict';
    var Matrix, defaults, pluginName;
    pluginName = 'contentMatrix';
    defaults = {
      effectType: 'glow',
      effectSpeed: 500
    };
    Matrix = (function() {
      function Matrix(element, options) {
        this.options = $.extend({}, defaults, options);
        this._defaults = defaults;
        this._name = pluginName;
        this.el = $(element);
        this.blocks = $(element).children('.contentBlock');
        this.effectsMap = {
          glow: 'glowEffect'
        };
        this.init();
      }

      Matrix.prototype.init = function() {
        var self;
        self = this;
        return this.blocks.on({
          mouseenter: function(e) {
            return self[self.effectsMap[self.options.effectType]]('on', e.target);
          },
          mouseleave: function() {
            return self[self.effectsMap[self.options.effectType]]('off');
          }
        });
      };

      Matrix.prototype.glowEffect = function(state, target) {
        var me, opacity;
        me = $(target).parents('.contentBlock');
        opacity = (state === 'on' ? 0.75 : 1);
        return this.blocks.not(me).stop().fadeTo(this.options.effectSpeed, opacity);
      };

      return Matrix;

    })();
    $.fn[pluginName] = function(options) {
      return this.each(function() {
        if (!$.data(this, 'plugin_#{pluginName}')) {
          $.data(this, 'plugin_#{pluginName}', new Matrix(this, options));
        }
      });
    };
  });

}).call(this);
