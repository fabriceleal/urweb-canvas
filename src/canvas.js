var UrCanvas = {
    cached_imgs : {},
    
    getContext2d: function(id) {
	if(id == null) er("no ID");
	var e = document.getElementById(id);
	if(e == null) er("no element with such ID");
	if(e.getContext == null) er("no GetContext available for such ID");
	return e.getContext('2d');
    },
    
    clearRect: function(ctx2d, x, y, width, height) {
	if(ctx2d == null) er("no ctx2d supplied");            
	ctx2d.clearRect(x, y, width, height);
    },
    
    fillRect: function(ctx2d, x, y, width, height) {
	if(ctx2d == null) er("no ctx2d supplied");            
	ctx2d.fillRect(x, y, width, height);
    },
    
    make_rgba: function (r, g, b, a) {
	return "rgb(" + r + ", " + g + ", " + b + ", " + a + ")";
    },
    
    make_img: function(url) {
	var cached_imgs = UrCanvas.cached_imgs;
	var img = cached_imgs[url];
	if (img === undefined) {
	    img = new Image();
	    img.src = url;
	    cached_imgs[url] = img;
	}
	return img;
    },
    
    requestAnimationFrame: function(fn) {
	window.requestAnimationFrame((function() {
	    execF(fn);
	}));
    },
    
    requestAnimationFrame2: function(fn) {
	var frameFn = null;
	frameFn = function() {
	    execF(execF(fn));
	    window.requestAnimationFrame(frameFn);	
	};	    
	window.requestAnimationFrame(frameFn);
    },

    setImgOnLoad : function(img, fn) {
	img.onload = function() {
	    execF(execF(fn));
	};
    },

    setInterval: function (fn, time) {
	setInterval(function() {
	    execF(execF(fn));
	}, time);
    },

    setTimeout: function (fn, time) {
	setTimeout(function() {
	    execF(execF(fn));
	}, time);
    },
    
    setFillStyle: function (ctx2d, style) {
	if(ctx2d == null) er("no ctx2d supplied");
	ctx2d.fillStyle = style;
    },
    
    setStrokeStyle: function (ctx2d, style) {
	if(ctx2d == null) er("no ctx2d supplied");
	ctx2d.strokeStyle = style;
    },
    
    drawImage: function  (ctx2d, id, srcX, srcY, srcW, srcH, destX, destY, destW, destH){
	if(ctx2d == null) er("no ctx2d supplied");
	if(id == null) er("no ID");
	
	var img = document.getElementById(id);
	if(img == null) er("no element with such ID");
	
	ctx2d.drawImage(img, srcX, srcY, srcW, srcH, destX, destY, destW, destH);
    },

    drawLine : function (ctx2d, srcX, srcY, destX, destY) {
	if(ctx2d == null) er("no ctx2d supplied");
	
	ctx2d.beginPath();
	ctx2d.moveTo(srcX, srcY);
	ctx2d.lineTo(destX, destY);
	ctx2d.stroke();
    },
    
    drawImage2: function  (ctx2d, img, destX, destY, destW, destH){
	if(ctx2d == null) er("no ctx2d supplied");
	if(img == null) er("no img supplied");
	
	ctx2d.drawImage(img, destX, destY, destW, destH);
    },

    drawImage22: function  (ctx2d, img, destX, destY){
	if(ctx2d == null) er("no ctx2d supplied");
	if(img == null) er("no img supplied");
	
	ctx2d.drawImage(img, destX, destY);
    },
    
    setGlobalCompositeOperation: function (ctx2d, compOp) {
	var compOps = {
	    DestinationOver: 'destination-over',
	    // TODO add the rest. this seems more reasonable than to transform the string everytime
	    // setGlobalComposite is called
	};
	
	ctx2d.globalCompositeOperation = compOps[compOp];
    },
    
    save: function (ctx2d) {
	if(ctx2d == null) er("no ctx2d supplied");
	ctx2d.save();
    },
    
    restore: function (ctx2d) {
	if(ctx2d == null) er("no ctx2d supplied");
	ctx2d.restore();
    },
    
    translate: function (ctx2d, x, y) {
	if(ctx2d == null) er("no ctx2d supplied");
	ctx2d.translate(x, y);
    },

    beginPath: function (ctx2d) {
	ctx2d.beginPath();
    },

    closePath: function (ctx2d) {
	ctx2d.closePath();
    },
    
    stroke: function (ctx2d) {
	ctx2d.stroke();
    },

    rotate: function (ctx2d, angle) {
	ctx2d.rotate(angle);
    },

    arc: function (ctx2d, x, y, radius, startAngle, endAngle, antiClockWise) {
	ctx2d.arc(x, y, radius, startAngle, endAngle, antiClockWise);
    },

    moveTo: function (ctx2d, x, y) {
	ctx2d.moveTo(x, y);
    },

    lineTo: function (ctx2d, x, y) {
	ctx2d.lineTo(x, y);
    },

    scale: function (ctx2d, x, y) {
	ctx2d.scale(x, y);
    },

    setLineWidth: function (ctx2d, width) {
	ctx2d.lineWidth = width;
    },

    setLineCap: function (ctx2d, cap) {
	var caps = {
	    Round: 'round'
	};
	ctx2d.lineCap = caps[cap];
    },

    fill: function (ctx2d) {
	ctx2d.fill();
    },

    getImgWidth: function (img) {
	return img.width;
    },

    getImgHeight: function (img) {
	return img.height;
    }
    
};

var UrDate = {
    getDate : function() {
	return new Date();
    },

    getSeconds : function (dt) {
	return dt.getSeconds();
    },

    getMilliseconds : function (dt) {
	return dt.getMilliseconds();
    },

    getHours: function (dt) {
	return dt.getHours();
    },

    getMinutes: function (dt) {
	return dt.getMinutes();
    }
    
};
