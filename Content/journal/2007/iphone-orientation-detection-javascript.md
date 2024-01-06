---
title: iPhone orientation detection (JavaScript)
date: 2007-09-14 05:00
description: Here is the most basic JavaScript to get the iPhone orientation detection going
tags: snippets
---

Here is the most basic JavaScript to get the iPhone orientation detection going:

```
<head>
<meta name="viewport" content="width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">

<script language="JavaScript">
  window.onload=function(){
    setTimeout(ip.updateLayout, 0);
    setInterval(ip.updateLayout, 100);
    setTimeout(ip.hideURLbar,100);
  };

  ip={
    pageWidth:null,
    updateLayout:function(){
      var width=window.innerWidth;
      if (width != ip.pageWidth) {
        ip.pageWidth = width;
        var orientation = width == 320 ? "portrait" : "landscape";
        // fire transition events
        orientation == 'portrait' ? ip.transitionToPortrait() : ip.transitionToLandscape();
        $(document.body).attr('class', orientation);
        setTimeout(function(){
            window.scrollTo(0, 1);
        }, 100);
      }
    },
    transitionToPortrait: function(){
    },
    transitionToLandscape: function(){
    },  
    hideURLbar:function(){
      window.scrollTo(0, 1);
    }
  };   
</script>
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: Helvetica;
    color: #FFFFFF;
    -webkit-user-select: none;
    cursor: default;
    -webkit-text-size-adjust: none;
  }

  body.portrait { 
    height:416px;
    background-color:red;
  }

  body.landscape { 
    height:270px;
    background-color:green;
  }
</style>
</head>

```
