# contentMatrix

## Summary

A plugin for creating a grid style element, or 'matrix'. Used on RIMEmbracingMobileChaos2.

## Options

Option | Description
--- | ---
effectType | The one and only option is 'glow'. When each section of the matrix is hovered, the 'glow' effect reduces the opacity of each grid section except the one you are hovering on
effectSpeed | Speed is set in milliseconds. Default is 500 (half a second)

## The Markup

The markup for this component is in contentMatrix.jade. The matrix itself is referred to as micrositeContentGrid.

## Implementing

###Jade

When using Jade, make sure the index.jade file has the include that references your contentMatrix jade file.

```jade
include contentMatrix
```
###CSS

Make sure to add the .css that is generated from the .scss file to the stylesheet that is associated with your website.

###JavaScript

Make sure to add the minified version of contentMatrix.js to the javascript file that is already associated with your website.

## CSS

This CSS for this component is generated from Sass. The 'glow' effect is not a style that is being applied via javascript. The stylesheet dictates how the matrix (grid) is set up. It defines the size of the grid component, the size of each individual grid, how many 'blocks' wide it should be and how many 'blocks' tall it should be. By default there is a base64 image set as the background of 'ContentBlock'. This can be removed, changed, etc.

#### Note

Nothing to note at this time.
