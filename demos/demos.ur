
open Canvas_FFI

fun main () =
    c <- fresh;
    let
	fun loadPage () =
	    ctx <- getContext2d c;
	    sun <- make_img(bless("https://mdn.mozillademos.org/files/1456/Canvas_sun.png"));
	    moon <- make_img(bless("https://mdn.mozillademos.org/files/1443/Canvas_moon.png"));
	    earth <- make_img(bless("https://mdn.mozillademos.org/files/1429/Canvas_earth.png"));

	    let
		fun draw () =
		    
		    setGlobalCompositeOperation ctx DestinationOver;
		    clearRect ctx 0 0 300 300;
(**
		    setFillStyle ctx (make_rgba 0 0 0 0.4);
		    setStrokeStyle ctx (make_rgba 0 153 255 0.4);
		    save ctx;
		    translate ctx 150 150;
**)
		    (** earth **)
(**		    time <- date;
		    rotate ctx ((2 * PI) / 60) * (seconds time) + ((2 * PI / 60000) * (milliseconds time));
		    translate ctx 105 0;
		    fillRect ctx 0 -12 50 24;
		    drawImage2 ctx earth -12 -12;
**)
		    (** moon **)
(**		    save ctx;
		    rotate ctx ((2 * PI) / 6) * (seconds time) + ((2 * PI / 6000) * (milliseconds time));
		    translate ctx 0 28.5;
		    drawImage2 ctx moon -3.5 -3.5;
		    restore ctx;
		    
		    restore ctx;

		    beginPath ctx;
		    arc ctx 150 150 105 0 (PI * 2) False;		    
		    stroke ctx;
**)		    
		    drawImage2 ctx sun 0 0 300 300;		    
		    return ()
	    in
		requestAnimationFrame2 draw;
		return ()
	    end			   
	    
    in
	return
	    <xml>
	      <body onload={loadPage()}>
		<canvas id={c} height=300 width=300>
		</canvas>
	      </body>
	    </xml>
    end
    
