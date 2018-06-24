var UrWeb = {

    Canvas: {

	getContext2d: function(id) {
	    if(id == null) er("no ID");
	    var e = document.getElementById(id);
	    if(e == null) er("no element with such ID");
	    if(e.getContext == null) er("no GetContext available for such ID");

	    return e.getContext('2d');
	},

	fillRect: function(ctx2d, x, y, width, height) {
	    if(ctx2d == null) er("no ctx2d supplied");
            
	    ctx2d.fillRect(x, y, width, height);
	},

	make_rgb: function (r, g, b) {
	    return "rgb(" + r + ", " + g + ", " + b + ")";
	},

	setFillStyle: function (ctx2d, style) {
	    if(ctx2d == null) er("no ctx2d supplied");

	    ctx2d.fillStyle = style;
	},

	drawImage: function  (ctx2d, id, srcX, srcY, srcW, srcH, destX, destY, destW, destH){
	    if(ctx2d == null) er("no ctx2d supplied");
	    if(id == null) er("no ID");
	    
	    var img = document.getElementById(id);
	    if(img == null) er("no element with such ID");
	    
	    ctx2d.drawImage(img, srcX, srcY, srcW, srcH, destX, destY, destW, destH);
	}

    }
};
