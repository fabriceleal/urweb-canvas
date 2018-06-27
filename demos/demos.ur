
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
		<canvas id={c}>
		</canvas>
	      </body>
	    </xml>
    end
    
