$(document).ready(function() {
    $('.burning').burn();
});

/*! jQuery Burn - v0.3.2 sinetheta.github.com/burn/ */
(function(e){function f(a){this.burning=null;this.settings=a;
  return this}var d={a:0.3,k:0.05,w:10,wind:1,strength:1,diffusion:1,flames:[{x:0,hsla:[58,96,89,1],y:0,blur:0.1},{x:0,hsla:[51,98,76,1],y:0.02,blur:0.15},{x:0,hsla:[36,100,60,1],y:0.04,blur:0.2},{x:0,hsla:[28,91,49,1],y:0.08,blur:0.25},{x:0,hsla:[19,94,41,1],y:0.15,blur:0.3},{x:0,hsla:[15,75,34,1],y:0.2,blur:0.4},{x:0,hsla:[14,66,16,1],y:0.5,blur:0.5}]};e.fn.burn=function(a,c){var b;if(!1===a)return(b=this.data("_burn"))&&b.off(),this;if("object"===
typeof a)c=a;else if("string"==typeof a)return(b=this.data("_burn"))
  &&void 0!==d[a]?void 0!==c?("title"==a&&b.content.html(c),b.settings[a]=c,!0):b.settings[a]:!1;c=e.extend({},d,c||{});return this.each(function(){var a=e.extend(!0,{},c),a=new f(a);a.elem=e(this);a.ignite();a.elem.data("_burn",a)})};f.prototype={ignite:function(){var a=this;if(a.burning)return a.burning;a.oldShadow=a.elem.css("text-shadow");(function b(){a.timer=window.requestAnimationFrame(b);a.burn()})()},wave:function(a,c,b){var g=
this.settings;return b*g.a*Math.sin(g.k*a-g.w*c)},burn:function(){var a=this,c=this.settings,b;b=e.map(c.flames,function(b){var e=-b.y,d=Math.sqrt(Math.random());b.x=a.wave(b.y,Date.now()/1E3,d);return(b.x+c.wind)*b.y*c.strength*c.diffusion+"em "+e*c.strength*c.diffusion+"em "+b.blur*c.strength*c.diffusion+"em hsla("+b.hsla[0]+", "+b.hsla[1]+"%, "+b.hsla[2]+"%, "+b.hsla[3]+")"});a.elem.css("text-shadow",b.join(", "))},off:function(){window.cancelAnimationFrame(this.timer);this.timer=null;this.elem.css("text-shadow",
this.oldShadow)}}})(jQuery);
(function(){for(var e=0,f=["ms","moz","webkit","o"],d=0;d<f.length&&!window.requestAnimationFrame;++d)window.requestAnimationFrame=window[f[d]+"RequestAnimationFrame"],window.cancelAnimationFrame=window[f[d]+"CancelAnimationFrame"]||window[f[d]+"CancelRequestAnimationFrame"];window.requestAnimationFrame||(window.requestAnimationFrame=function(a){var c=(new Date).getTime(),b=Math.max(0,16-(c-e)),d=window.setTimeout(function(){a(c+b)},b);e=c+b;return d});window.cancelAnimationFrame||(window.cancelAnimationFrame=
function(a){clearTimeout(a)})})();