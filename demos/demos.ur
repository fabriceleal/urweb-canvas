
open Canvas_FFI
open Date
     
val pi = 3.141592653589793

val black = make_rgba 0 0 0 1.0

val white = make_rgba 255 255 255 1.0

val transparent = make_rgba 0 0 0 0.0
	    
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
		    clearRect ctx 0.0 0.0 300.0 300.0;

		    setFillStyle ctx (make_rgba 0 0 0 0.4);
		    setStrokeStyle ctx (make_rgba 0 153 255 0.4);
		    save ctx;
		    translate ctx 150.0 150.0;
		    
		    (** earth **)
		    time <- getDate; 
		    rotate ctx (((2.0 * pi) / 60.0) * (float (seconds time)) + ((2.0 * pi / 60000.0) * (float (milliseconds time))));
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
		<h1>Solar System</h1>
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
		fun drawMark () =
		    beginPath ctx;
		    rotate ctx (pi / 6.0);
		    moveTo ctx 100 0;
		    lineTo ctx 120 0;
		    stroke ctx

		and drawMinuteMark (i : int) =
		    if (mod i 5) = 0 then			    
			rotate ctx (pi / 30.0)
		    else
			beginPath ctx;
			moveTo ctx 117 0;
			lineTo ctx 120 0;
			stroke ctx;
			rotate ctx (pi / 30.0)

		and doTimesAux i n (func : int -> transaction unit) =
		    if n > 0 then
			func i;
			doTimesAux (i + 1) (n - 1) func
		    else
			func i
		    	
		and doTimes n (func : unit -> transaction unit) =		    
		    if n > 0 then
			func ();
			doTimes (n - 1) func
		    else
			func ()

		and fix12 f =
		    if f > 12 then
			f - 12
		    else
			f
			
		and draw () =
		    now <- getDate;
		   
		    save ctx;
		    clearRect ctx 0.0 0.0 150.0 150.0; 
		    translate ctx 75.0 75.0;
		    scale ctx 0.4 0.4; 
		    rotate ctx ((-1.0) * pi / 2.0); 
		    setStrokeStyle ctx black;
		    setFillStyle ctx white;
		    setLineWidth ctx 8.0; 
		    setLineCap ctx Round;

		    (* hour marks *) 
		    save ctx;
		    doTimes 11 drawMark;
		    restore ctx;

		    (* minute marks *)
		    save ctx;
		    setLineWidth ctx 5.0;
		    doTimesAux 0 59 drawMinuteMark;
		    restore ctx;
		    
		    let
			val sec = float (seconds now)
			val min = float (minutes now)
			val hr = float (fix12 (hours now))
		    in
			setFillStyle ctx black;

			(** write hours **)
			
			save ctx;
			rotate ctx (hr * (pi / 6.0) + (pi / 360.0) * min + (pi / 21600.0) * sec);
			setLineWidth ctx 14.0;
			beginPath ctx;
			moveTo ctx (-20) 0;
			lineTo ctx 80 0;
			stroke ctx;
			restore ctx;

		    (** write minutes **)
			save ctx;
			rotate ctx ((pi / 30.0) * min + (pi / 1800.0) * sec);
			setLineWidth ctx 10.0;
			beginPath ctx;
			moveTo ctx (-28) 0;
			lineTo ctx 112 0;
			stroke ctx;
			restore ctx;

		    (** write seconds **)
			save ctx;
			rotate ctx (sec * pi / 30.0);
			setStrokeStyle ctx (make_rgba 212 0 0 1.0);
			setFillStyle ctx (make_rgba 212 0 0 1.0);
			setLineWidth ctx 6.0;
			beginPath ctx;
			moveTo ctx (-30) 0;
			lineTo ctx 83 0;
			stroke ctx;
			beginPath ctx;
			arc ctx 0.0 0.0 10.0 0.0 (pi * 2.0) True;
			fill ctx;
			beginPath ctx;
			arc ctx 95.0 0.0 10.0 0.0 (pi * 2.0) True;
			stroke ctx;
			setFillStyle ctx transparent;
			arc ctx 0.0 0.0 3.0 0.0 (pi * 2.0) True;
			fill ctx;
			restore ctx
		    end;
		    
		    beginPath ctx;
		    setLineWidth ctx 14.0;
		    setStrokeStyle ctx (make_rgba 50 95 162 1.0);
		    arc ctx 0.0 0.0 142.0 0.0 (pi * 2.0) True;
		    stroke ctx;
		    
		    restore ctx;
		    
		    return ()
	    in
		requestAnimationFrame2 draw;
		return ()
	    end	
	    
    in
	return
	    <xml>
	      <body onload={loadPage()}>
		<h1>Clock</h1>
		<canvas id={c} height=300 width=300>
		</canvas>
	      </body>
	    </xml>
    end

fun loopingPanorama () =
    c <- fresh;
    let
	val canvasW = 800.0
	val canvasH = 200.0
	val speed = 30
	val scale = 1.05
	val y = (-4.5)
	val dx = 0.75
	
	fun loadPage () =
	    ctx <- getContext2d c;
	    img <- make_img(bless("https://mdn.mozillademos.org/files/4553/Capitan_Meadows,_Yosemite_National_Park.jpg"));	    
	    let		
		fun imgLoad () =
		    let
			val imgH = (height img) * scale
			val imgW = (width img) * scale
			
			val clearX = if imgW > canvasW then
					 imgW
				     else
					 canvasW

			val clearY = if imgH > canvasH then
					 imgH
				     else
					 canvasH

			val x = if imgW > canvasW then
				    canvasW - imgW
				else
				    0.0
				   
			fun draw x =
			    fn _ =>
			       clearRect ctx 0.0 0.0 clearX clearY ;
			       
			       if imgW <= canvasW then
				   let
				       val x2 = if x > canvasW then
						    (-imgW) + x
						else
						    x
				   in
				       i <- (if x2 > 0.0 then
						 drawImage2 ctx img ((-imgW) + x2) y imgW imgH
					     else
						 return ());
				       i2 <- (if x2 - imgW > 0.0 then
						  drawImage2 ctx img ((-imgW) * 2.0 + x2) y imgW imgH
					      else
						  return ());

				       drawImage2 ctx img x2 y imgW imgH;
				       setTimeout (draw (x2 + dx)) speed
				   end
			       else
				   let
				       val x2 = if x > canvasW then
						    canvasW - imgW
						else
						    x
				   in
				       i <- (if x2 > (canvasW - imgW) then
						 drawImage2 ctx img (x2 - imgW + 1.0) y imgW imgH
					     else
						 return ());

				       drawImage2 ctx img x2 y imgW imgH;
				       setTimeout (draw (x2 + dx)) speed
				   end
		    in
							 
			setTimeout (draw x) speed
		    end
	
	    in    
		setImgOnLoad img imgLoad;	    
		return ()
	    end
    in
	return
	    <xml>
	      <body onload={loadPage()}>
		<h1>Looping panorama</h1>
		<canvas id={c} height=200 width=800>
		</canvas>
	      </body>
	    </xml>
    end
    
