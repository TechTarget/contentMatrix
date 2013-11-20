###!
contentMatrix v1.0.0 (https://github.com/TechTarget/contentMatrix)
Author: Morgan Wigmanich <okize123@gmail.com> (http://github.com/okize)
Copyright (c) 2013 | Licensed under the MIT license
http://www.opensource.org/licenses/mit-license.php
###

((factory) ->

  # use AMD or browser globals to create a jQuery plugin.
  if typeof define is 'function' and define.amd
    define [ 'jquery' ], factory
  else
    factory jQuery

) ($) ->

  'use strict'

  pluginName = 'contentMatrix'

  # default plugin options
  defaults =
    effectType: 'glow' # glow,
    effectSpeed: 500 # the speed at which the effect transitions

  # plugin constructor
  class Matrix

    constructor: (element, options) ->
      @options = $.extend({}, defaults, options)
      @_defaults = defaults
      @_name = pluginName
      @el = $(element)
      @blocks = $(element).children('.contentBlock') # contentMatrix component dom container
      @effectsMap =
        glow: 'glowEffect'
      @init()

    # initialize plugin
    init: ->
      self = this

      # bind mouse hover events to blocks and call effect set in options
      @blocks.on
        mouseenter: (e) ->
          self[self.effectsMap[self.options.effectType]] 'on', e.target
        mouseleave: ->
          self[self.effectsMap[self.options.effectType]] 'off'

    # glow effect
    glowEffect: (state, target) ->
      me = $(target).parents('.contentBlock')
      opacity = (if (state is 'on') then 0.75 else 1)
      # select all the divs except the one that's being moused-over and fade them by 25%
      @blocks.not(me).stop().fadeTo(@options.effectSpeed, opacity)

  # lightweight wrapper around the constructor that prevents multiple instantiations
  $.fn[pluginName] = (options) ->
    @each ->
      if !$.data(@, 'plugin_#{pluginName}')
        $.data(@, 'plugin_#{pluginName}', new Matrix(@, options))
      return
  return