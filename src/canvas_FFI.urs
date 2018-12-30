type rgba
     
val make_rgba : int -> int -> int -> float -> rgba
val make_rgb : int -> int -> int -> rgba

(*val white : rgba*)

(*val black : rgba*)
				    
type img

val make_img : url -> transaction img
val width : img -> float
val height : img -> float
		    
type canvas2d

val clearRect : canvas2d -> float -> float -> float -> float -> transaction unit
								       
val fillRect : canvas2d -> int -> int -> int -> int -> transaction unit						       
val setFillStyle : canvas2d -> rgba -> transaction unit
val setStrokeStyle : canvas2d -> rgba -> transaction unit
val drawImage : canvas2d -> id -> int -> int -> int -> int -> int -> int -> int -> int -> transaction unit
val save : canvas2d -> transaction unit
val restore : canvas2d -> transaction unit
val drawImage2 : canvas2d -> img -> float -> float -> float -> float -> transaction unit
val drawImage22 : canvas2d -> img -> float -> float -> transaction unit
val translate : canvas2d -> float -> float -> transaction unit
val rotate : canvas2d -> float -> transaction unit
val arc : canvas2d -> float -> float -> float -> float -> float -> bool -> transaction unit
val getContext2d : id -> transaction canvas2d
val beginPath : canvas2d -> transaction unit
val closePath : canvas2d -> transaction unit
val stroke : canvas2d -> transaction unit
val fill : canvas2d -> transaction unit
		       
val requestAnimationFrame : (unit -> transaction unit) -> transaction unit

val requestAnimationFrame2 : (unit -> transaction unit) -> transaction unit
							  
val canvas : bodyTag ([Width = int, Height = int] ++ boxAttrs)

val lineTo : canvas2d -> int -> int -> transaction unit

val moveTo : canvas2d -> int -> int -> transaction unit

val drawLine : canvas2d -> int -> int -> int -> int -> transaction unit

val scale : canvas2d -> float -> float -> transaction unit

val setLineWidth : canvas2d -> float -> transaction unit

val setImgOnLoad : img -> (unit -> transaction unit) -> transaction unit 

val setInterval : (unit -> transaction unit) -> int -> transaction unit

val setTimeout : (unit -> transaction unit) -> int -> transaction unit
						       
datatype lineCap =
	 Round

val setLineCap : canvas2d -> lineCap -> transaction unit
						
datatype compositeOperation =
	 DestinationOver
	     (*
dont forget to add them to canvas.js compOps dictionary

	 SourceOver
       | SourceIn
       | SourceOut
       | SourceAtop
       | DestinationOver
       | DestinationIn
       | DestinationOut
       | DestinationAtop
       | Lighter
       | Copy
       | Xor
       | Multiply
       | Screen
       | Overlay
       | Darken
       | Lighten
       | ColorDodge
       | ColorBurn
       | HardLight
       | SoftLight
       | Difference
       | Exclusion
       | Hue
       | Saturation
       | Color
       | Luminosity
*)
val setGlobalCompositeOperation : canvas2d -> compositeOperation -> transaction unit
			 
