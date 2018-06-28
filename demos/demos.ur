
open Canvas_FFI
open Date
     
val pi = 3.141592653589793

fun solarSystem () =
    c <- fresh;
    let
	fun loadPage () =
	    
	    sun <- make_img(bless("https://mdn.mozillademos.org/files/1456/Canvas_sun.png"));
	    moon <- make_img(bless("https://mdn.mozillademos.org/files/1443/Canvas_moon.png"));
	    earth <- make_img(bless("https://mdn.mozillademos.org/files/1429/Canvas_earth.png"));

	    let
		fun draw () =
		    ctx <- getContext2d c;	    
		    setGlobalCompositeOperation ctx DestinationOver;
		    clearRect ctx 0 0 300 300;

		    setFillStyle ctx (make_rgba 0 0 0 0.4);
		    setStrokeStyle ctx (make_rgba 0 153 255 0.4);
		    save ctx;
		    translate ctx 150.0 150.0;
		    
		    (** earth **)
		    time <- getDate; 
		    rotate ctx (((2.0 * pi) / 60.0) * (float (seconds time)) + ((2.0 * pi / 60000.0) * (float (milliseconds time)))); (**  **)
		    translate ctx 105.0 0.0;
		    fillRect ctx 0 (-12) 50 24;
		    drawImage22 ctx earth (-12.0) (-12.0);

		    (** moon **)
		    save ctx; 
		    rotate ctx (((2.0 * pi) / 6.0) * (float (seconds time)) + ((2.0 * pi / 6000.0) * (float (milliseconds time))));
		    translate ctx 0.0 28.5;
		    drawImage22 ctx moon (-3.5) (-3.5);
		    restore ctx;
		    
		    restore ctx;

		    beginPath ctx;
		    arc ctx 150.0 150.0 105.0 0.0 (pi * 2.0) False;		    
		    stroke ctx;

		    drawImage2 ctx sun 0.0 0.0 300.0 300.0;		    
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

    
fun clock () =
    c <- fresh;
    let
	fun loadPage () =
	    ctx <- getContext2d c;
	    let
		fun draw () =
		    now <- getDate;
		    (*
		    save ctx;
		    clearRect ctx 0 0 150 150;
		    translate ctx 75 75;
		    scale ctx 0.4 0.4;
		    rotate ctx (-1.0 * pi / 2.0);
		    setStrokeStyle ctx black;
		    setFillStyle ctx white;
		    setLineWidth ctx 8.0;
		    setLineCap ctx Round;
		    *)
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
